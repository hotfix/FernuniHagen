(* -----------------------------------------------
 * Kurs: 01852 Fortgeschrittene Konzepte funktionaler Programmierung	
 * Fernuni Hagen
 * SoSe 2016
 * Einsendeaufgaben zu Kurseinheit 1
 * Aufgabe 4
----------------------------------------------- *)

(*Teil 1*)
fun make_map_fn f = fn(elem,teilliste) => f elem::teilliste;
val liste = [[1,2,3,4],[2,3],[4,3]];
val liste2 = [1,2,3,4];
fun dobleVal x = x*x;
map hd (liste);
map dobleVal  (hd liste);


(*Teil 2*)

fun make_filter_fn f = fn(elem,teilliste) => if f elem then elem::teilliste else teilliste;
