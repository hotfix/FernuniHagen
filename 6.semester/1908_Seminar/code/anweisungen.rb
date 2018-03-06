n =2
# If - Anweisung
if n > 0
  p "n grösser Null"
elsif n < 0
  p "n kleiner Null"
else
  p "n gleich Null"
end

n =2
# unless - Anweisung
unless n != 0
  p "n gleich null"
end


# Anweisungsmodifizierer
kursname = "Seminar Programmiersysteme" if kursNr == 1908


case
  when n > 0
    "n kleiner als 0"
  when n < 0
    "n grösser als 0"
  else
    "n gleich 0"
end



 array = [ "a" , "b" , "c" , "d" ]
 for l in array
     puts l
  end

 array.each{|l| puts l}



