(* 
 *  Einige Definitionen aus Kapitel 2
 *)

type 'a lazy = unit -> 'a
fun force (f:'a lazy) = f () 
;


datatype 'a sequ = NIL | CONS of 'a * 'a sequ lazy
;

fun from n = CONS (n,fn ()=>from (n+1));
val nats = from 1

fun circular n = CONS (n,fn ()=>circular n)
val ones = circular 1
;

(* 
fun circular () = CONS (1,fn ()=>circular ())
val ones = circular ()
*)


fun first 0 s            = []
 |  first n NIL          = []
 |  first n (CONS (x,r)) = x::first (n-1) (force r)

fun maps f NIL          = NIL
 |  maps f (CONS (x,r)) = CONS (f x,fn ()=>maps f (force r))

fun filters p NIL          = NIL
 |  filters p (CONS (x,r)) = 
    if p x then CONS (x,fn ()=>filters p (force r))
           else filters p (force r)
;

(* sqr und odd sind bereits in KE1.sml definiert *)
fun sqr (x:int) = x*x
fun odd x = x mod 2 = 1
;

val squares = maps sqr nats
val odds = filters odd nats
;

fun sieve (CONS (x,r)) = CONS (x,fn ()=>sieve
            (filters (fn i=>i mod x<>0) (force r)))
val primes = sieve (from 2)
;

