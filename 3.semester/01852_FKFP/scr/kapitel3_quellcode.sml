(*
 *  Einige Definitionen aus den Abschnitten 3.2 und 3.3
 *)

(* fun totalsize l = sum (map size l) *)
fun totalsize []     = 0
 |  totalsize (x::l) = size x + totalsize l 
;


(* fun fib 0 = 1
    |  fib 1 = 1
    |  fib n = fib (n-1) + fib (n-2) *)
fun fibpair 0 = (1,0)
 |  fibpair n = let val (x,y) = fibpair (n-1)
                 in
                    (x+y,x)
                end
;
fun fib 0 = 0
 |  fib 1 = 1
 |  fib n = (op +) (fibpair (n-2))
;


fun le x y = (y:int) <= x
fun gr x y = (y:int) > x
fun filter p [] = []
 |  filter p (x::l) = if p x then x::filter p l 
                             else    filter p l
fun qsort []     = []
 |  qsort (x::l) = qsort (filter (le x) l) @ [x] @
                   qsort (filter (gr x) l)
fun index 1 (x::l) = x
 |  index k (x::l) = index (k-1) l
(* fun select k l = index k (qsort l) *)

fun partition l x = (filter (le x) l,filter (gr x) l)
fun select k (x::l) =
    let val (low,high) = partition l x
        val m = length low
     in 
        if k<m then select k     low  else
        if k>m then select (k-m) high
               else x
    end
;


fun foldl f u []     = u
 |  foldl f u (x::l) = foldl f (f (u,x)) l 

fun or (x,y) = x orelse y
(* fun exists p = foldl or false o map p *)
(* val totalsize = foldl (op +) 0 o map size *)
fun exists p = foldl (fn (x,y)=>or (x,p y)) false
val totalsize = foldl (fn (x,y)=>x+size y) 0
;

fun scanl f u []     = [u]
 |  scanl f u (x::l) = [u] @ scanl f (f (u,x)) l
fun inits l = scanl (fn (l,y)=>l@[y]) [] l

fun h' f g ((x,y),z) = let val w = g (y,z)
                        in
                           (f (x,w),w)
                       end
fun tails []     = [[]]
 |  tails (x::l) = (x::l)::tails l

(* listConcat und max werden in KE1.sml definiert *)
fun listConcat l = foldr op@ [] l
fun max (x:int,y) = if x>y then x else y
;

fun segs l = (listConcat o map tails o inits) l
;

(* val mss = maxl o map sum o segs *)
fun h' ((x,y),z) = let val w = y+z
                    in
                       (max (x,w),w)
                   end
val mss = #1 o foldl h' (0,0) 
;
