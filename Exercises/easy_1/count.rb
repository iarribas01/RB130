# def count(arr)
#   num_elements = 0

#   arr.each do |item|
#     num_elements += 1 if yield(item)
#   end

#   num_elements
# end

def count(arr)
  arr.select{|item| yield(item)}.size
end

puts count([1,2,3,4,5]) { |value| value.odd? } == 3
puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count([1,2,3,4,5]) { |value| true } == 5
puts count([1,2,3,4,5]) { |value| false } == 0
puts count([]) { |value| value.even? } == 0
puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2