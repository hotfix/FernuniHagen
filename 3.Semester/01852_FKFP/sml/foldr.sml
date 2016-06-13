fun curry f x y = f (x,y);
fun foldr f u [] = u
| foldr f u (x::l) = f (x,foldr f u l);

val sum = foldr op+ 4;
sum [1,2,3]; (* 1+(2+(3+4)) 10*)

val prod = foldr op* 4;
prod [1,2,3]; (* 1*(2*(3*4))= 24*)

val length = foldr (fn (x:int,y)=>y+1) 0;
length [1,2,3,4]; (*  *)

fun l1 @ l2 = foldr op:: l2 l1;
[1,2,3]@[4,5,6];

fun rev l = foldr (fn (x,y) => y@[x]) [] l;
rev [1,2,3];

fun map f = foldr (fn (x,y) => f x::y) [];

fun maxl l = foldr max (hd l) (tl l);
fun implode l = foldr op^ "" (map str l);