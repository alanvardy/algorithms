def merge_sort(list)
  return list if list.length < 2

  left = merge_sort(list.slice!(0, list.length/2))
  right = merge_sort(list)

  new_list = []
  until left.empty? && right.empty? do
    if !left.empty? && !right.empty?
      if left[0] > right[0]
        new_list << right.shift
      else
        new_list << left.shift
      end
    elsif right.empty?
      new_list << left.shift
    elsif left.empty?
      new_list << right.shift
    end
  end
  return new_list
end

unsorted = [4,1,8,2,3,9,7]

puts merge_sort(unsorted).inspect