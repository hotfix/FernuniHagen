type ('a,'b) dic = ('a * 'b) list;

val x = [(2,3),(4,5)];

(*
	x - Schlüssel
    l - Liste mit Paaren
	u - default Wert
*)
fun assoc (x,[],u)       = u
      |  assoc (x,(y,z)::l,u) = if x=y then z else assoc (x,l,u);
	  
assoc (2,x,5); (*=> 3, zu zwei existiert 3*)
assoc (1,x,5); (*=> 5, zu 1 existiert kein wert*)

