
def compute(initial_val)
  block_given? ? yield(initial_val) : 'Does not compute.'
end

puts compute(2) { |n| n + 5 + 3 } == 10
puts compute('c') { |n|'a' + 'b' + n } == 'abc'
puts compute('z') == 'Does not compute.'