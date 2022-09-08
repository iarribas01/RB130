def reduce(array, initial_value = nil)
  if initial_value
    array.unshift(initial_value)
  end
  
  accumulator = array[0]
  
  for element in array[1..-1]
    accumulator = yield(accumulator, element)
  end
  accumulator
end

alias inject reduce 


array = [1, 2, 3, 4, 5]

# puts reduce(array) {|acc, num| acc + num}     # => 15
# puts reduce(array, 10) { |acc, num| acc + num }                # => 25
# puts reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
# 
# puts reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

