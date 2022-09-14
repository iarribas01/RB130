# def missing(arr)
#   result = []
#   index = 0

#   until index >= arr.length - 1
#     next_element = arr[index + 1]
#     current_element = arr[index]

#     unless ((current_element + 1) == next_element)
#       result += (current_element + 1 .. next_element-1).to_a
#     end

#     index += 1
#   end

#   result
# end

def missing(arr)
  result = []
  arr.each_cons(2) do |first, second|
    unless first == second - 1
      result += (first + 1..second-1).to_a
    end
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []