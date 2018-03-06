def methode(a, b, c, *d)
  puts [a, b, c].to_s
  puts ">--------<"
  puts d.to_s
end
#methode(1, 2, 3, 4, 5, 6)
puts "########"
def methode(*a, b, c, d)
  puts a.to_s
  puts ">--------<"
  puts [b, c, d].to_s
end
#methode(1, 2, 3, 4, 5, 6)





def methode(a=1, b, c)
  p a+b+c
end
#methode 1,2,4


def methode(a, b:, c:)
  puts [a, b, c].to_s
end
methode(1,b:2,c:3)


def wert=(x)
  return x + 5
end
p (wert=5)
#=> 5
