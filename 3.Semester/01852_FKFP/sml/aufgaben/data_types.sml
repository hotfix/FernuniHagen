(* a) 3.5*2 *)
3.5*2.0;

(*b) size "abc"^"def" *)

size ("abc"^"def");
(* c) 7.0 / 0.0 *)
7.0 / 0.0;

(* d) not 3<>4 orelse 3=<2 *)
not(3<>4) orelse (3<=2);

(* e) 17.0 mod 3.0  *)
17 mod 3 ;

(* f) if if true then 3<2 else false then 1 else 2 *)
if (if true then 3<2 else false) then 
  1 
else 
  2;

(* g) 5DIV3  *)
  5 div 3; 
(* h) false andalso false orelse true *)
false andalso false orelse true;

(*  i) 7.0>0.0 and 3>4  *)
(7.0>0.0) andalso (3>4) ;

(* j) if 0<=1 then .1 else .2  *)
if 0<=1 then 0.1 else 0.2 ;

(* k) "^"^""^"^" *)
"^"^""^"^";
(* l) ~(1-~3)  *)
~(1-(~3));