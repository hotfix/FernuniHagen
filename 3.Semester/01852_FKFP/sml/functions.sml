fun map (f,[]) =[]
  | map (f,x::l) = f x::map (f,l);
 
map (size,["a","","vier"]);
map (fn x=>x+1,[1,2,3]);
 
val text = [["A","B","Bu"],["Und","aus","bist","Du"]];

fun listsize l = map (size,l);
map (listsize,text);