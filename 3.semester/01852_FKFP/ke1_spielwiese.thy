
theory KE1
imports Main
begin

ML \<open>7+4\<close>
ML \<open>2E1 * 2\<close>
ML \<open>2E1/1E1\<close>
ML \<open>-3.0 +3.5\<close>
ML \<open>"korrekt" ^ #"?"\<close>
ML \<open>"korrekter " ^ "string?"\<close>
ML \<open>(1+1,"Text",4.0)\<close>
ML \<open>{1+1,"Text",4.0}\<close>
ML \<open>{a=1+1,b="Text",c=4.0}\<close>
ML \<open>[1+1,"Text",4.0]\<close>
ML \<open>[1|[2,3]]\<close>
ML \<open>["Ein","Text","in"]@["einer","Liste"]\<close>
ML \<open>{Artikelnr = 12345, Bezeichnung = "Diskettenlaufwerk"}\<close>
ML \<open>7+4\<close>
ML \<open>7+4\<close>

ML \<open>fun sqr x = x*x\<close>
ML \<open>
fun max (x:int,y) = if x<y then y else x;
max(130,12);\<close>

ML \<open>
fun maxl l =  if l=[] then 0
  else max(hd(l),maxl(tl l));

maxl([1,2,34,5,6,7,8]);
\<close>

ML \<open>tl(tl([1,2,3,4,5]))\<close>

ML \<open>hd(tl([1,2,3,4,5]))\<close>


ML \<open>
(*
Aufgabe 2: Teil1
Vertorprodukt
*)
fun v_v_mult (l1,l2) = if (length(l1) <> length(l2)) orelse (l1=[] andalso l2=[]) then 0
                          else hd(l1) * hd(l2) + v_v_mult (tl(l1),tl(l2));
(*testcases*)
v_v_mult([],[]);
v_v_mult([1],[2]);
v_v_mult([1],[2,2]);
v_v_mult([1,2,3,4,5],[5,4,3,2,1]);



\<close>
end