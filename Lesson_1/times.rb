
# method implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number                      # return the original method argument to match behavior of `Integer#times`
end

# method invocation
times(5) do |num|
  puts num
end

########

# 5.times do |num|
#   puts num
# end

# returns number it was called on
# takes a block parameter
# iterates from 0 to num-1, (this is the 
# block parameter value)

def times(num)
  if block_given?
    for n in 0...num
      yield(n)
    end
  end
  num
end

puts (times(5) do |num|
  puts num
end)