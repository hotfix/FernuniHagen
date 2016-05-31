type point = real * real;
datatype geo = POINT of point
                  | CIRCLE of point * real
                  | RECT of {lowLeft:point, upRight:point};
				
val p = POINT (2.0,3.0);  
val c = CIRCLE ((2.0,3.1),5.0);
val r = RECT({lowLeft=(1.0,1.0),upRight=(5.0,5.0)});

(*Aufzählunstyp*)
datatype color = RED | GREEN | BLUE;

(*pattern matching*)
val CIRCLE (point,radius) = c;
val POINT(x,_) = p;


fun circleArea r = 3.1415 * r * r;
fun area (POINT _)                = 0.0
      |  area (CIRCLE (_,r))           = circleArea r
      |  area (RECT {lowLeft=(x1,y1),
                     upRight=(x2,y2)}) = abs ((x1-x2)*(y1-y2));


					 
