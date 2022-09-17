def each_cons(arr)
  start_index = 0
  end_index = 1

  until end_index >= arr.length
    yield(arr[start_index], arr[end_index])
    start_index += 1
    end_index += 1 
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
puts result == nil
puts hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
puts hash == {}
puts result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
puts hash == {'a' => 'b'}
puts result == nil