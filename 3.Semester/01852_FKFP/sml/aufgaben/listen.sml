(* a) {1="a",3=false}  *)
{1="a",3=false};
(* b) {"a"=1} *)
(*Zeichenketten sind als Record Lables nicht zugelassen*)
{a=1};

(* c) {false=true}  *)
{false=true};
(* d) ({})  *)
({});
(* e) {()}  - kein Gültiger Record Eintrag*)
{a=()} ;
(* f) #2 (((1,2),3),4)  *)
#2 (((1,2),3),4) ;

(* g) 2::["3","4"]  *)
"2"::["3","4"] ;
(* h) [3,4]::nil  *)
[3,4]::nil ;
(* i) nil@[3,4]  *)
nil@[3,4];
(* j) [hd [4]]@tl [4]  *) 
[hd [4]]@tl [4];
(* k) tl [3,[]]  *)
tl [[3],[]] ;
(* l) tl [[2,3]]  *)
tl [[2,3]];
(* m) tl (hd [[],[3]])  tl ist nicht für leere Listen definiert*)
(*tl (hd [[],[3]]); *)
(* n) tl [hd ["a"],implode [#"b"],"1.5"]  *)
tl [hd ["a"],implode [#"b"],"1.5"] ;