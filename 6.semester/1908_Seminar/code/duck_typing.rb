# Methode die eine Liste auf die stdout ausgibt
def print_list(array)
  array.each{|x| puts x}
end

# Aufruf mit einem Array Objekt
print_list(["a","b","c"])
# a
# b
# c

#Aufruf mit einem Range Objekt
print_list(1..3)
# 1
# 2
# 3

# Aufruf mit einem Fixnum Objekt
print_list(1)
# `print_list': undefined method `each' for 1:Integer (NoMethodError)


a = [1,2,3,4,5]
while not a.empty?
  puts a.pop
end
# => 5 4 3 2 1

a = ["a","b","c"]
until a.empty?
  puts a.pop
end