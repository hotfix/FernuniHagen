(* 
 *  Einige Definitionen aus Kapitel 6
 *)

              

(* Abschnitt 6.2 *)

(* der Typkonstruktor lazy und die Funktion force sind in lazy.sml definiert *)
type 'a lazy = unit -> 'a
fun force (f:'a lazy) = f () 
;
type var = string

datatype expr =
    Int    of int
  | Bool   of bool
  | Con    of var * expr list
  | Var    of var
  | UnOp   of var * expr
  | BinOp  of var * expr * expr
  | Cond   of expr * expr * expr
  | App    of expr * expr
  | Abs    of var * expr
  | Let    of var * expr * expr
  | LetRec of (var * expr) list * expr
  | Clos   of expr * env lazy
withtype 
    binding = var * expr
and env     = binding list
;


fun ins l E = l@E
fun lookup (x,(y,e)::E) = if x=y then e else lookup (x,E)
;


(*  call-by-value interpreter  *)

fun apply1 "not" (Bool x)             = Bool (not x)
 |  apply1 "hd"  (Con ("cons",[x,y])) = x
 |  apply1 "tl"  (Con ("cons",[x,y])) = y

fun apply2 "+" (Int x,Int y) = Int (x+y)
 |  apply2 "-" (Int x,Int y) = Int (x-y)
 |  apply2 "*" (Int x,Int y) = Int (x*y)
 |  apply2 ">" (Int x,Int y) = Bool (x>y)
 |  apply2 "<" (Int x,Int y) = Bool (x<y)
 |  apply2 "=" (Int x,Int y) = Bool (x=y)
 |  apply2 "=" (Bool x,Bool y) = Bool (x=y)
 |  apply2 "=" (Con (c,l),
                Con (c',l')) = Bool (c=c' andalso alleq (l,l'))

and alleq ([],[]) = true
 |  alleq (x::l,y::l') = 
   (fn Bool b=>b) (apply2 "=" (x,y)) andalso alleq (l,l')
;

fun def E Efun (x,Abs (y,e)) = (x,Clos (Abs (y,e),Efun))
 |  def E Efun (x,e)         = (x,eval e E)

and eval (Int i)           E = Int i
 |  eval (Bool b)          E = Bool b
 |  eval (Con (c,l))       E = Con (c,map (fn x=>eval x E) l)
 |  eval (Var x)           E = lookup (x,E)
 |  eval (UnOp (f,e))      E = apply1 f (eval e E)
 |  eval (BinOp (f,e1,e2)) E = apply2 f (eval e1 E,eval e2 E)
 |  eval (Cond (e,e1,e2))  E = eval (if (fn Bool b=>b) (eval e E)
                                     then e1 else e2) E
 |  eval (App (e,e'))      E =  
    let val Clos (Abs (x,e''),E') = eval e E
     in
        eval e'' (ins [(x,eval e' E)] (force E'))
    end
 |  eval (Abs (x,e))       E = Clos (Abs (x,e),fn ()=>E)
 |  eval (Let (x,e,e'))    E = eval e' (ins [(x,eval e E)] E)
 |  eval (LetRec (d,e))    E = 
         let fun NewE () = ins (map (def E NewE) d) E
          in
             eval e (force NewE)
         end
;


(* examples *)

(* simple functions *)
val suc   = Abs ("x",BinOp ("+",Var "x",Int 1));
val pred  = Abs ("x",BinOp ("-",Var "x",Int 1));
val plus  = Abs ("x",Abs ("y",BinOp ("+",Var "x",Var "y")));
val twice = Abs ("f",Abs ("x",App (Var "f", App (Var "f",Var "x"))));
val comp  = Abs ("f",Abs ("g",Abs ("x",App (Var "f", App (Var "g",Var "x")))));

(* recursive functions *)
val fak   = LetRec (
             [("f",Abs ("x",Cond (BinOp ("<",Var "x",Int 2),Int 1,
                             BinOp ("*",Var "x", 
                               App (Var "f",BinOp("-",Var "x",Int 1))))))],
             Var "f")
val foldri = LetRec (
             [("g",Abs ("f", Abs ("u", Abs ("l",
                   Cond (BinOp ("=",Var "l",Con ("nil",[])),
                               Var "u",
                               App (App (Var "f",UnOp ("hd",Var "l")),
                                    App (App (App (Var "g",Var "f"),Var "u"),
                                         UnOp ("tl",Var "l"))
                                      ))))))],
             Var "g")
;



(* Abschnitt 6.3 *)

(* dummy datatype for representing normal values and 
   updateable dummy entries in environments *)
   
datatype '_a dummy = 
   Val of '_a
 | Dum of '_a ref

fun norm (Val x) = x
 |  norm (Dum x) = !x
;


(* values and operations of the SECD machine *)

datatype value =
    I  of int
  | B  of bool
  | T  of string * value list
  | CL of code list * value dummy list
  | UNDEF

and code = 
    LD   of value
  | LDV  of int
  | LDC  of code list
  | LDT  of string * int
  | APP  
  | RAP  of int  
  | DUM  of int  
  | COND of code list * code list
  | RET
  | ADD | SUB | MULT | NOT | EQ | LT | GT | HD | TL
;


(* some auxiliary functions:
   index    selects kth element of a list
   mkdummy  creates a new environment with n updateable entries at the front
   upddummy updates dummy entries
   revi     gets the first n elements of a list in reverse order
   popi     drops the first n elements of a list *)
   
fun index 1 (x::l) = x
 |  index k (x::l) = index (k-1) l

fun revi 0 _      = []
 |  revi n (x::l) = revi (n-1) l@[x]
 
fun popi 0 l      = l
 |  popi n (x::l) = popi (n-1) l

fun mkdummy 0 E = E
 |  mkdummy n E = mkdummy (n-1) (Dum (ref UNDEF)::E)

fun upddummy [] E              = ()
 |  upddummy (x::l) (Dum v::E) = (v:=x; upddummy l E)
;


(*  SECD transitions  *)

fun step (S,E,LD  x::C,D)                 = (x::S,E,C,D)
 |  step (S,E,LDV k::C,D)                 = (norm (index k E)::S,E,C,D)
 |  step (S,E,LDC C'::C,D)                = (CL (C',E)::S,E,C,D)
 |  step (S,E,LDT (c,n)::C,D)             = (T (c,revi n S)::popi n S,E,C,D)
 |  step (CL (C',E')::x::S,E,APP::C,D)    = ([],Val x::E',C',(S,E,C)::D)
 |  step (x::S,E,[],(S',E',C')::D)        = (x::S',E',C',D)
 |  step (I y::I x::S,E, ADD::C,D)        = (I (x+y)::S,E,C,D)
 |  step (I y::I x::S,E, SUB::C,D)        = (I (x-y)::S,E,C,D)
 |  step (I y::I x::S,E,MULT::C,D)        = (I (x*y)::S,E,C,D)
 |  step (I y::I x::S,E,  LT::C,D)        = (B (x<y)::S,E,C,D)
 |  step (I y::I x::S,E,  GT::C,D)        = (B (x>y)::S,E,C,D)
 |  step (y::x::S,E,      EQ::C,D)        = (B (x=y)::S,E,C,D)
 |  step (B x::S,E,      NOT::C,D)        = (B (not x)::S,E,C,D)
 |  step (T ("cons",[x,y])::S,E,HD::C,D)  = (x::S,E,C,D)
 |  step (T ("cons",[x,y])::S,E,TL::C,D)  = (y::S,E,C,D)
 |  step (B true::S, E,COND (C1,C2)::C,D) = (S,E,C1,([],[],C)::D)
 |  step (B false::S,E,COND (C1,C2)::C,D) = (S,E,C2,([],[],C)::D)
 |  step (S,E,[RET],(_,_,C)::D)           = (S,E,C,D)
 |  step (S,E,DUM n::C,D)                 = (S,mkdummy n E,C,D)
 |  step (CL (C',E')::S,E,RAP n::C,D)     = 
         (upddummy (revi n S) E; (S,E,C',(popi n S,popi n E,C)::D))

fun loop (S,E,[],[]) = S
 |  loop state = loop (step state)
 
fun secd C = loop ([],[],C,[])
;


(* SECD compiler *)

fun cmd "+"   = ADD
 |  cmd "-"   = SUB
 |  cmd "*"   = MULT
 |  cmd "="   = EQ
 |  cmd ">"   = GT
 |  cmd "<"   = LT
 |  cmd "not" = NOT
 |  cmd "hd"  = HD
 |  cmd "tl"  = TL

fun position x (y::l) = 1+(if x=y then 0 else position x l)

fun listConcat l = foldr op@ [] l 
;
fun compile (Int i)           N = [LD (I i)]
 |  compile (Bool b)          N = [LD (B b)]
 |  compile (Var x)           N = [LDV (position x N)]
 |  compile (Con (c,l))       N = 
      listConcat (map (fn e=>compile e N) l)@[LDT (c,length l)]
 |  compile (UnOp (f,e))      N = compile e N@[cmd f]
 |  compile (BinOp (f,e1,e2)) N = compile e1 N@compile e2 N@[cmd f]
 |  compile (Cond (e,e1,e2))  N = 
      compile e N@[COND (compile e1 N@[RET],compile e2 N@[RET])]
 |  compile (App (e,e'))      N = compile e' N@compile e N@[APP]
 |  compile (Abs (x,e))       N = [LDC (compile e (x::N))]
 |  compile (Let (x,e,e'))    N = compile e N@[LDC (compile e' (x::N)),APP]
 |  compile (LetRec (d,e))    N = 
    let val  n = length d
        val N' = map #1 d@N
        val ci = listConcat (map (fn (v,e)=>compile e N') d)
     in
        DUM n::ci@[LDC (compile e N'),RAP n]
    end
;
