def plus(a,b)
  puts a + b
end
class Mathe
  def self.summiere(a,b)
    plus(a,b)
  end
end
plus(3,3)
Mathe.summiere(3,3) # 6
#1.plus(3,3)

=begin

class Klasse



  def methode1(a)
    puts a
  end
  alias methode1 m1
  def methode1(a,b)
    m1(a)
    puts b
  end
end

k = Klasse.new
=end
#k.methode1(2,3)

p "##################"
def methode(a, b=nil)
  puts [a,b]
end
p methode(1)
p methode(1,1)
p "##################"

def methode2(param1=nil, param2)
  if param1.nil?
    param1
  else
    param1 + param2
  end
end
p methode2(1)
p methode2(1,1)

p "##################"
def foo(a, b, c = 'default', *d, e)
  puts [a, b, c]
  puts d
  puts e
end

foo(1, 2, 3)
