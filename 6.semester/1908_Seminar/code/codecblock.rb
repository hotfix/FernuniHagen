=begin
def quersumme zahl
  qs = 0
  i = 0
  loop do
    break if i > zahl.to_s.length-1 # Iteration beenden
    qs += zahl.to_s[i].to_i # Werte aufsummieren
    i += 1
    yield qs #Block ausführen
  end


end

quersumme(333) {|summe| puts "Quersumme = " + summe.to_s }

s = 0
quersumme(333) {|summe|  s +=summe }



def dupliziereMitNachbehandlung(zahl)
  zahl *= 2
  if block_given? then
    yield (zahl)
  else
    zahl
  end
end
dupliziereMitNachbehandlung(3)

dupliziereMitNachbehandlung(3) { | wert |  wert + 1}


def bruttoNettoBerechnung (wert, bruttoNettoKnz='b' )
   if block_given? then
     yield wert, bruttoNettoKnz
   else
     wert
   end
end

#p bruttoNettoBerechnung(119,'n'){|wert,bruttoNettoKnz| if bruttoNettoKnz == 'b' then wert * 1.19 else wert /1.19 end } # 100.0
bruttoNettoBerechnung(100){|wert| wert * 1.19 } # 119.0
=end

# Block als Paramter
def bruttoNettoBerechnung (wert,&block )
  block.call(wert)
end

block = proc {|wert| wert * 1.19 }
p bruttoNettoBerechnung(100,&block)