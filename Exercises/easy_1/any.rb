def any?(arr)
  return false if arr.empty?
  arr.each do |element|
    return true if yield(element)
  end
  false
end

puts any?({:hello => "hello"}) {|key, value| value.start_with?('z')}

# puts any?([1, 3, 5, 6]) { |value| value.even? } == true
# puts any?([1, 3, 5, 7]) { |value| value.even? } == false
# puts any?([2, 4, 6, 8]) { |value| value.odd? } == false
# puts any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# puts any?([1, 3, 5, 7]) { |value| true } == true
# puts any?([1, 3, 5, 7]) { |value| false } == false
# puts any?([]) { |value| true } == false