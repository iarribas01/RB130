def compare(str)
  puts "Before: #{str}"
  puts "After: #{yield(str)}"
end


compare('hello'){|word| word.upcase}
compare('hello') {|word| word.reverse}
compare('hello') {|word| "lkfjas;ofj;slkdfj"}
compare('hello') {|word| puts "hi"}

# def test
#   yield(1)
# end

# test {|num1, num2| p num2}


########

# # method implementation
# def increment(number)
#   if block_given?
#     yield(number + 1)
#   end
#   number + 1
# end

# # method invocation
# increment(5) do |num|
#   puts num
# end


########

# def say(words)
#   yield if block_given?
#   puts "> " + words
# end


# say("Hi there") do 
#   system 'clear'
# end

########

# def echo_with_yield(str)
#   yield if block_given?
#   str
# end

# p echo_with_yield("hello")
# p echo_with_yield("hello") {puts "hi"}

########

