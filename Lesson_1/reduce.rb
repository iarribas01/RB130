# yields to two arguments (accumulator, current element)
# accumulator is set to the return value of the block
# optional initial value when passing in argument

# start value given
# 20, [1, 2, 3] accumulator = 20
# 
# 

# start value not given:
# [1, 2, 3] accumulator = array[0] = 1
# 1 + 2
# 3 + 3
# iterate through the elements
  # 


def reduce(array, initial_value = nil)

  if initial_value
    accumulator = initial_value
  else
    array = array[2..-1]
    accumulator = array[0]
  end


  for element in array
    accumulator = yield(accumulator, element)
  end
  accumulator
end

array = [1, 2, 3, 4, 5]
# accumulator = 1
# accumulator = yield(1, 1)
# accumulator = 2, 2

puts reduce(array) { |acc, num| acc + num }                    # => 15
puts reduce(array, 10) { |acc, num| acc + num }                # => 25
# puts reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass