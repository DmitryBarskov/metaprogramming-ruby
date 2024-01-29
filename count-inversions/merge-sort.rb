def merge_sort(array)
  return array if array.size <= 1

  middle = array.size / 2
  sorted1 = merge_sort(array[...middle])
  sorted2 = merge_sort(array[middle...])

  merge(sorted1, sorted2)
end

def merge(array1, array2)
  return array1 if array2.empty?
  return array2 if array1.empty?

  merged = Array.new(array1.size + array2.size)
  m = 0
  i1 = 0
  i2 = 0

  while i1 < array1.size && i2 < array2.size
    if array1[i1] < array2[i2]
      merged[m] = array1[i1]
      i1 += 1
    else
      merged[m] = array2[i2]
      i2 += 1
    end
    m += 1
  end

  while i1 < array1.size
    merged[m] = array1[i1]
    i1 += 1
    m += 1
  end
  while i2 < array2.size
    merged[m] = array2[i2]
    i2 += 1
    m += 1
  end

  merged
end

merge_sort([5, 2, 9, 1, 5, 1, -2, -5]) => [-5, -2, 1, 1, 2, 5, 5, 9]
