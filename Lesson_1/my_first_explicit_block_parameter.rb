def for_each_in(arr)
  arr.each { |element| yield element }
end

arr = [1, 2, 3, 4, 5]
results = [0]

for_each_in(arr) do |number|
  total = results[-1] + number
  results.push(total)
end

p results # => [0, 1, 3, 6, 10, 15]


######

# def display(block)
#   block.call(">>>")
# end

# def test(&block)
#   puts "1"
#   display(block)
#   puts "2"
# end

# test {|prefix| puts prefix + "xyz"}

######

# def test2(block)
#   puts "hello"
#   block.call          # calls the block that was originally passed to test()
#   puts "good-bye"
# end

# def test(&block)
#   puts "1"
#   test2(block)
#   puts "2"
# end

# test { |prefix| puts "xyz" }

######


# def test(&block)
#   puts "What's &block? #{block}"
# end

# test {sleep(1)}