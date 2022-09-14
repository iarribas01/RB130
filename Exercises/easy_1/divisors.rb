def divisors(n)
  (1..n).to_a.select {|divisor| n % divisor == 0 }
end

def divisors_optimized(n)
  result = []
  1.upto((n/2)+ 1) do |divisor|
    # puts divisor
    result.unshift(n / divisor) if n % divisor == 0
  end
  result.unshift(1) unless n == 1
  result
end

def display_time
  start = Time.now
  yield
  finish = Time.now
  puts finish - start
end

# p divisors_optimized(1)== [1]
# p divisors_optimized(7) == [1, 7]
# p divisors_optimized(12) == [1, 2, 3, 4, 6, 12]
# p divisors_optimized(98) == [1, 2, 7, 14, 49, 98]
# p divisors_optimized(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# puts divisors(1) == [1]
# puts divisors(7) == [1, 7]
# puts divisors(12) == [1, 2, 3, 4, 6, 12]
# puts divisors(98) == [1, 2, 7, 14, 49, 98]
# puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

display_time{divisors(99400891)}
display_time{divisors_optimized(99400891)}