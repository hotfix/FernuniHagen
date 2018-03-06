class Person
  def initialize (name, alter)
    @name = name
    @alter = alter
  end
end

class Student
  attr_reader :name, :mtknr
  attr_writer :mtknr
  def initialize (name)
    @name = name
  end

  def belegeModul(modul)

  end

  def belegeModul(modul, semester)

  end
end

student = Student.new("Alexander")
student.mtknr = 34
p student



class Integer

  def isPrimzahl?
    (2..Math.sqrt(self)).each { |i|
      if self % i == 0 && i < self
        return false
      end
    }
    true
  end

end

p 4.isPrimzahl?
p 7.isPrimzahl?