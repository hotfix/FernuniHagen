#succ = ->(x){puts "Lambda Block"}
#p succ.call
#=> wrong number of arguments (given 0, expected 1) (ArgumentError)

#inc = lambda {|x| "block"}
#p inc.call

inc = proc {|x| "Proc Block"+x.to_s}
p inc.call


def proc_bsp
  puts "Vor dem Block"
  p = Proc.new { return "proc" }
  p.call
  puts "Nach dem Block"
end
p proc_bsp
#=> Before proc
#=> proc

def lambda_bsp
  puts "Vor dem Block"
  l = -> { return "lambda" }
  l.call
  puts "Nach dem Block"
end
p lambda_bsp
#=> Before lambda
#=> After lambda
#=> nil


irb(main):020 > 1.respond_to? :to_str
=> false
irb(main):021 > "1".respond_to? :to_str
=> true