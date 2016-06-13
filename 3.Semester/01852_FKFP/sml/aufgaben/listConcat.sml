fun foldr f u [] = u
| foldr f u (x::l) = f (x,foldr f u l);

fun rev l = foldr (fn (x,y) => y@[x]) [] l;
fun listConcat l = foldr op@ (hd l) (tl l) ;
listConcat ([[1,2],[3,4]]);
rev (listConcat ([[1,2],[3,4]]));

fun listConcat2 l = foldr op@ [] l;
listConcat2 ([[1,2],[3,4]]);