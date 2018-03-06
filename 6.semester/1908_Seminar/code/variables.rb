# declarations
seminar = "1908 programmiersysteme"
seminar2 = seminar

p seminar
p seminar2

seminar[5] = "P"

p seminar
p seminar2

# nil -Referenz
class NilReferenz
  attr_accessor :not_initialized
end

ni = NilReferenz.new
p ni.not_initialized


x = 3 #=> Integer
y = "Ruby" #=> String
z = 1.5 #=> Float


