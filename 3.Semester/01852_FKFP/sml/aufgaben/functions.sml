fun max (x:int,y) = if x > y then x else y;


fun maxl l = if l=[] then 0 
			 else max(hd l , maxl(tl l));