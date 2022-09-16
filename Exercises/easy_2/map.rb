require 'set'

def map(arr)
  result = []
  for item in arr
    result << yield(item)
  end
  result
end

puts map(Hash['a' => 100, 'b' => 200]) {|key, value| value+1}
# puts map(Set.new(1..10)) {|value| value.to_s}
# puts map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# puts map([]) { |value| true } == []
# puts map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# puts map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# puts map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

=begin
This will work with sets and arrays, but working
with hashes will not produce the desired result
due to the nature of its key-value pair system.

It will return an array, rather than the type of 
collection that was passed in.

=end