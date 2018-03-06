# addierer und subtrahierer haben eine "Funktion" als Rückgabewert
def addierer(a, b)
  ->(a,b) { a + b }
end
def subtrahierer(a, b)
  ->(a,b) { a - b }
end

# Funktion, kann als Wert einer Variable zugewiesen werden
fkt_addierer = addierer(1,1)
# call führt die Funktion aus
p fkt_addierer.call(1,1) #=> 2

# alternativer Aufruf
#p subtrahierer(10,5).call #=> 5




# Jedes Element wird mit sich selbst multipliziert
# Als Ergebnis wird eine Liste mit neuen Werten zurückgeliefert
[1,2,3,4].map {|x| x * x } # => [1, 4, 9, 16]

# filtert die Elemente einer Liste anhand der Bedingung im Block
[2,4,5,6,7].select { |i|   i.odd? } # => [5, 7]

# Summiert alle Elemente einer Liste und gibt als Ergebnis zurück
[10,20,30].inject{|sum, x| sum + x} # => 60



# Ausgangsfunktion
summe = proc { |x, y, z| x + y + z }

# partieller Auswertung, wenn der erste Aufruf mit zwei Argumenten erfolgen soll
# wird die  o.g. Funktion zur folgenden Funktion umgewandelt
summe = proc { |x, y| proc { |z| x + y + z} }
# Aufruf
summe.call(1,2).call(3) #=>6

# currying
# wird die  o.g. Funktion zur folgenden Funktion umgewandelt
summe = proc { |x| proc { |y| proc { |z| x + y + z} } }
# Aufruf
summe.call(1).call(2).call(3)#=>6

# Einsatz der Methode curry
def add(a, b, c)
  a + b + c
end

add_currying = add.curry # => #<Proc:0x0000000004f258b0 (lambda)>
# Jetzt erfolgt der Aufruf, wie bereits oben aufgeführt.
p add_currying.(1).(2).(3) #=> 6
