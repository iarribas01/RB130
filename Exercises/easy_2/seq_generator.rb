=begin 
Return value should maybe be a range
with the start and limit?

Since in most cases, #step is called on 
a Range object. Returning another Range
object allows us to chain methods

=end

def step(start, limit, step)
  current = start
  while current < limit
    yield(current)
    current += step
  end
  current
end

step(1, 10, 3) { |value| puts "value = #{value}" }