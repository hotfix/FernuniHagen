type 'a monoid = 'a * ('a * 'a -> 'a);

type ('a,'b) dic = ('a * 'b) list;


(* a) fun f (x,y) = (x,x) *)
fun f (x,y) = (x,x);
(* val f  = fn :'a * 'b -> 'a * 'a *)


(* b) fun g (x,y) = if true then (x,y) else (y,x) *)
fun g (x,y) = if true then (x,y) else (y,x) 
(*val g = fn : 'a * 'a -> 'a * 'a *)

(* c) local fun g x = x=1 
       in
         fun f x = (x,g x)
     end  *)
local fun g x = x=1 
       in
         fun f x = (x,g x)
     end;
(*val f = fn : int -> int * bool*)
	 
(* d) local fun f x = if true then g x else g x 
	        and g x = if true then f x else f x
      in
         fun h x = (f x,g x)
end
 *)
	 
	 local fun f x = if true then g x else g x 
	 	        and g x = if true then f x else f x
	       in
	          fun h x = (f x,g x)
	 end;
(*val h = fn : 'a -> 'b * 'c*)