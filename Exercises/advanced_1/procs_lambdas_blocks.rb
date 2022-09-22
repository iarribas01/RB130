# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc          # #<Proc:0x00007fffbf75a208 procs_lambdas_blocks.rb:2>
puts my_proc.class    # Proc
my_proc.call          # This is a .
my_proc.call('cat')   # This is a cat.

=begin 
  =========PROCS=========
  Observation:
    * lenient arity
    * nil when block parameter referenced, but not provided
    * works fine when correct num of arguments is passed
  ==========================================================================================
=end

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda           # #<Proc:0x00007ffff84f14d8 procs_lambdas_blocks.rb:17 (lambda)>
puts my_second_lambda    # #<Proc:0x00007ffff84f1460 procs_lambdas_blocks.rb:18 (lambda)>
puts my_lambda.class     # Proc
my_lambda.call('dog')    # This is a dog.
my_lambda.call           # ArgumentError, 0 for 1
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # NameError, uninitialized Lambda

=begin 
  =========LAMBDAS=========
  Observation:
    * strict arity
    * lambdas belong to the Proc class
    * you cannot instantiate a lambda
    * ArgumentError thrown when wrong num of arguments is passed
    * works fine when correct num of arguments is passed
  ==========================================================================================
=end

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # This is a .
block_method_1('seal')                                     # LocalJumpError

=begin 
  =========BLOCKS=========
  Observation:
    * cannot yield to a block where not given
    * block has access to variables in the surrounding scope and block parameters
  ==========================================================================================
=end


# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."                      # This is a turtle and a .
end
block_method_2('turtle') { puts "This is a #{animal}."}          # NameError, undefined `animal`


=begin 
  =========BLOCKS=========
  Observation:
    * Lenient arity
    * will assign variables to nil when referenced but not provided
    * cannot access the method's variables in which the block is being passed to
  ==========================================================================================
=end


=begin 

Final notes:

Procs
  * lenient arity
  * can instantiate
  * saved to variables
  * has a call method in order to execute

Blocks
  * lenient arity, but yield must only be called
      when a block is provided
  * has yield keyword to execute

Lambdas
  * strict arity
  * cannot instantiate using new method
  * saved to variables
  * has a call method in order to execute
=end