enum = Enumerator.new do |yielder|
  counter = factorial = 1

  loop do
    yielder << factorial
    factorial *= counter
    counter += 1
  end
end

p enum.take(7)



p enum.next
p enum.next
p enum.next
p enum.next
p enum.next
p enum.next
p enum.next
p enum.next

p enum.next
p enum.next
p enum.next

enum.rewind

p enum.next
