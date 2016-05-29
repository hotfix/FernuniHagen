let val x=3 
	local val x=4
	   in
		  val y=x
	end 
in
  x 
end;
(*resul: 3*)

(*********************************)
local val x=1 
   in 
end;
(*keine Ausgabe*)

(*********************************)
local val x=2
      val y=let 
		      local val x=x*x (*x = 2*2 *)
                 in
                    val x=x*x (*x = 4*4 *)
              end 
		    in
               x*x (* 16*16 *)
		    end
   in
      val x=y div x div x (*x = 256 /2 / 2*)
end
(*resul 64*)
 