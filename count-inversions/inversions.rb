# Side effect: sorts the input array
def count_inversions!(array, from: 0, to: array.size)
  return 0 if to - from <= 1

  middle = from + (to - from) / 2
  inv1 = count_inversions!(array, from:, to: middle)
  inv2 = count_inversions!(array, from: middle, to:)

  inv1 + inv2 + merge!(array, from, middle, middle, to)
end

def merge!(array, start1, end1, start2, end2)
  array1 = array[start1...end1]
  m = start1
  i1 = 0
  i2 = start2
  inversions = 0

  while i1 < array1.size && i2 < end2
    if array1[i1] <= array[i2]
      array[m] = array1[i1]
      i1 += 1
    else
      inversions += 1
      array[m] = array[i2]
      i2 += 1
    end
    m += 1
  end

  while i1 < array1.size
    array[m] = array1[i1]
    i1 += 1
    m += 1
  end
  inversions
end

count_inversions!([2, 3, 9, 2, 9]) => 2
