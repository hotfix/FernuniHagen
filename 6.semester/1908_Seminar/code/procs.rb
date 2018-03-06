class Operator
  def initialize(&operation)
    @op = operation
  end

  def execute(a, b)
    @op.call(a,b)
  end
end
mal = Operator.new{ |a,b| a * b }
durch = Operator.new{ |a,b| a / b }

#p mal.execute(2,3) # 6
#p durch.execute(6,2) # 3


def get_proc(&block)
  block
end

mal = get_proc{ |a,b| a * b }
durch = get_proc{ |a,b| a / b }
p mal.call(2,3) #=> 6
p durch.call(6,2) #=> 3

# erste Möglichkeit
inc = proc {|x| x + 1}

# zweite Möglichkeit
inc = Proc.new {|x| x + 1}

inc.call(2)
# => 3