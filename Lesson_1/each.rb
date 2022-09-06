

# iterates through each element in array
# block parameter is the current element in array
# the method yields to the block
# array remains unaffected
# return original calling array


def each(array)
  for element in array
    yield(element)
  end
  array
end

# [1, 2, 3].each {|num| puts ">>> #{num}"}
p(each([1, 2, 3]) {|num| puts ">>> #{num}"}.select{|num| num.odd?})