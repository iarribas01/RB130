def missing(arr)
  result = []
  arr.each_with_index do |n, index|
    if (n + 1 == arr[index + 1]) # if the next element is +1
      result << n
    else
    end
  end
  result
end

=begin
1. iterate through elements in array [1, 2, 4]
2. check that the next element is +1 from the last
  3. if it isn't, add the in_betweens to the result array
    # iterate from [a..b-1] and add to result array
  4. if it is, move to the next element
5. continue until end of array is reached
6. return result array

=end
p missing([1, 2, 3])
# missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# missing([1, 2, 3, 4]) == []
# missing([1, 5]) == [2, 3, 4]
# missing([6]) == []