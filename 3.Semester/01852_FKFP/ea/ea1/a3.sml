(* -----------------------------------------------
 * Kurs: 01852 Fortgeschrittene Konzepte funktionaler Programmierung	
 * Fernuni Hagen
 * SoSe 2016
 * Einsendeaufgaben zu Kurseinheit 1
 * Aufgabe 3
----------------------------------------------- *)

(*Teil 1*)
datatype ''a multimenge = LEER
						| EINELEM of ''a
						| VEREIN of ''a multimenge * ''a multimenge;
						

val e1 = EINELEM (2);
val e2 = EINELEM (3);
val e3 = EINELEM (4);
val leer1 = LEER;
val leer2 = LEER;
val leer3 = LEER;
val leer4 = LEER;
val verein = VEREIN(leer1,leer2);
val verein2 = VEREIN(e1,leer2);
val verein3 = VEREIN(leer1,e2);
val verein3 = VEREIN(e1,e2);

(*Teil 2*)
fun number (_, LEER) = 0
|	number(wert, EINELEM elem) = if elem = wert then 1 else 0
|	number(wert, VEREIN(menge1, menge2))  = number (wert, menge1) + number(wert,menge2);

number(2, leer1);

(*Teil 3*)

fun simplify (LEER) = LEER
|	simplify (EINELEM e) = EINELEM e
| 	simplify (VEREIN(m1,m2))=
						let val e1 = simplify m1
							val e2 = simplify m2 
						in if e1 = LEER then e2
							else if e2 = LEER then e1
							else VEREIN( e1,e2)
						end;
simplify (verein);
simplify (verein2);
simplify (verein3);


(*Teil 4*)

fun delete_all (_, LEER) = LEER
|	delete_all (e, EINELEM x) = if e = x then LEER else EINELEM x
|	delete_all (e, VEREIN(m1,m2)) = VEREIN(delete_all(e,m1), delete_all(e,m2));

delete_all(3,e2);
delete_all(3,verein3);


(*Teil 5*)

fun delete_one (_,LEER) = LEER
|	delete_one (e,EINELEM x) = if e = x then LEER else EINELEM x
| 	delete_one (e, VEREIN(m1,m2)) = if number(e,m1) > 0 then VEREIN(delete_one(e,m1),m2)
									else VEREIN(m1,delete_one(e,m2))
;
										