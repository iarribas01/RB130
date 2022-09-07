# [1, 2, 3].select {|n| n.odd?}

# retains order of elements
# returns new array where block evaluates to true


def select(array)
  selected_elements = []
  for element in array
    selected_elements << element if yield(element)
  end
  selected_elements
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true