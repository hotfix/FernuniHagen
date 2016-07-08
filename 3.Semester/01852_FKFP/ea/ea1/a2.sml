(* Funktion zum Multiplizieren zweier Vektoren*)
fun v_v_mult  _			[]      = 0.0 
|	v_v_mult []		  	_		= 0.0		 
| 	v_v_mult (x::zv)  	(y::sv) = x * y + v_v_mult zv sv
  ;
  
(*Test: v_v_mult*)
val sv = [0.0];
val zv = [1.3];
v_v_mult zv sv; (*expected 0.0*)

val sv = [2.0,3.5,5.3];
val zv = [1.3,7.1,2.7];
v_v_mult zv sv; (*expected 2.6*)

val sv = [];
val zv = [1.3];
v_v_mult zv sv; (*expected 0.0*)

val sv = [1.0];
val zv = [];
v_v_mult zv sv; (*expected 0.0*)


(* Funktion zum Multiplizieren einer Matrix mit einem Vektor*)

fun m_v_mult []	_ = []
|	m_v_mult  _	[] = []
|	m_v_mult (zv::m) sp = (v_v_mult zv sp) :: (m_v_mult m sp)
;
(*Test: m_v_mult*)

val m = [];
val sp = [];
m_v_mult m sp;

val m = [];
val sp = [2.0];
m_v_mult m sp;

val m = [[2.0,3.1]];
val sp = [];
m_v_mult m sp;

val m = [[2.2,3.1],[6.1,0.1]];
val sp = [0.3,1.9];
m_v_mult m sp;


(*help function zum transponieren der matrix*)
fun transpose ([]::_) = []
|	transpose  m    = (map hd m) :: transpose (map tl m); 


(*Funktion zum Multiplizieren zweier Matrizen*)

fun m_m_mult []	_ = []
|	m_m_mult _	[] = []
|	m_m_mult (m1) (sv::m2) = m_v_mult m1 sv ::  m_m_mult m1 m2
;

fun m_m_mult2 m1 m2 =  m_m_mult m1 (transpose m2);

val m1 = [ [1.1, 1.2], 
           [2.3, ~3.4],
           [0.0, 1.5],
           [1.7, 1.0] ]
and m2 = [ [5.2,  0.0, 2.0],
           [3.3, 6.9, 0.0] ];
		 
m_m_mult2 m1 m2;		 

