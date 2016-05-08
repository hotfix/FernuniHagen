(* 
 *  Einige Definitionen aus Kapitel 1
 *
 *  Version fuer SML'97, getestet mit SML/NJ v110.74 (April 2013)
 *)


(* Abschnitt 1.4 *)

fun circleArea r = 3.1415 * r * r
fun pie (r,w) = 3.1415 * r * r * w / 360.0

fun sqr (x:int) = x * x
fun max (x:int,y) = if x>y then x else y

fun fak  n = if n=0 then 1 else n * fak (n-1)
fun sum  l = if l=[] then 0 else hd l + sum (tl l)
fun maxl l = if l=[] then 0 else max (hd l,maxl (tl l))

fun even n = n=0 orelse n>1 andalso odd (n-1)
and odd n = n=1 orelse even (n-1)
;



(* Abschnitt 1.5 *)

type point = real * real
type polygon = point list
type 'a monoid = 'a * ('a * 'a -> 'a)
type ('a,'b) dict = ('a * 'b) list
;

fun id x = x
fun fst (x,y) = x
fun ignore x = "Argument ist futsch"
(* 
fun length l = if l=[] then 0 else 1 + length (tl l)

Im folgenden wird die Version mit patern matching (s.u.) verwandt
*)
;



(* Abschnitt 1.6 *)

datatype geo = POINT  of point
             | CIRCLE of point * real
             | RECT   of {lowLeft:point, upRight:point};
datatype color = RED | GREEN | BLUE;
datatype tree = NODE of int * tree * tree
              | EMPTY
(* 
polymorphe Version:

datatype 'a tree = NODE of 'a * 'a tree * 'a tree
                 | EMPTY
*)
;

fun area (POINT _)                = 0.0
 |  area (CIRCLE (_,r))           = circleArea r
 |  area (RECT {lowLeft=(x1,y1),
                upRight=(x2,y2)}) = abs ((x1-x2)*(y1-y2))

fun find (y,EMPTY) = false
 |  find (y,NODE (x,left,right)) = 
         if y=x then true else
         if y<x then find (y,left) else
                     find (y,right)

fun length nil    = 0
 |  length (x::l) = 1 + length l

fun assoc (x,[],u)       = u
 |  assoc (x,(y,z)::l,u) = if x=y then z else assoc (x,l,u)
;

(* Abschnitt 1.7 *)

fun filter (p,[])   = []
 |  filter (p,x::l) = if p(x) then x::filter (p,l) 
                              else    filter (p,l)
;

(* 
Die Funktionen map und foldr sind in SML/NJ vordefiniert

fun map f []     = []
 |  map f (x::l) = f x::map f l 

fun foldr f u []     = u
 |  foldr f u (x::l) = f (x,foldr f u l);
*)

fun mult x y = x*y:int
fun assoc []         u x = u
 |  assoc ((y,z)::l) u x = if x=y then z else assoc l u x
;

fun curry f x y = f (x,y)

val sum       = foldr op+ 0
fun implode l = foldr op^ "" (map str l)
fun maxl l    = foldr max (hd l) (tl l)
;
(*
Die folgenden Funtkionen sind alle in SML/NJ vordefiniert

fun l1 @ l2   = foldr op:: l2 l1 
fun length l  = foldr (fn (x,y)=>y+1) 0 l
fun rev l     = foldr (fn (x,y)=>y@[x]) [] l
fun map f     = foldr (fn (x,y)=>f x::y) []
*)

fun last l = (hd o rev) l
fun odd x = (not o even) x
fun nestmap f = (map o map) f
;

fun listConcat l = foldr op@ [] l
;
