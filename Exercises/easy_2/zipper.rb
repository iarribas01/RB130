def zip(arr1, arr2)
  arr2 = arr2.clone
  arr1.clone.map { |item| [item, arr2.shift] }
end
arr1 = [1, 2, 3]
arr2 = [4, 5, 6]
p zip(arr1, arr2) == [[1, 4], [2, 5], [3, 6]]
p arr1
p arr2