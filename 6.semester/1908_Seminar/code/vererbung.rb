class Person
  def initialize(name)
    @name = name
  end

  def name
    puts @name
  end

  private :name
end

class Student < Person
  #  Definition von initialize nicht notwendig
  public :name
end

s = Student.new("Alex")
s.name


module Mixin
end

module Outer
  include Mixin
  def hello
    puts"Hello"
  end
end

class Klasse
  extend Outer
end
p Mixin.included_modules   #=> []
p Outer.included_modules   #=> [Mixin]
p Klasse.included_modules
p Klasse.instance_methods
Klasse.hello
#k = Klasse.new.hello




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

KlasseMitInclude.new.module_method       # "Methode aus dem Mixin!"

KlasseMitExtend.module_method            # "Methode aus dem Mixin!"