array = Array.new
liste = [24, "Dezember", 1.314, nil]
leeres_array = []


leer = {}
coors = {:x => 15, :y =>37, :z =>9}
coors[:x] #=> 15



array = [ "a" , "b" , "c" , "d" ]
for l in array
  puts l
end

module Mixin
  def module_method
    puts "Methode aus dem Mixin!"
  end
end
class KlasseMitInclude
  include Mixin
end
class KlasseMitExtend
  extend Mixin
end