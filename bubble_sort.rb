def bubble_sort(array)
  unsorted = array.length
  while (unsorted > 0) do
    (unsorted - 1).times do |counter|
      if array[counter] > array[counter + 1]
        array[counter], array[counter + 1] = array[counter + 1], array[counter]
      end
    end
    unsorted -= 1
  end
  array
end

def bubble_sort_by(array)
  unsorted = array.length
  while (unsorted > 0) do
    (unsorted - 1).times do |counter|
      answer = yield(array[counter], array[counter + 1])
      array[counter], array[counter + 1] = array[counter + 1], array[counter] if answer > 0
    end
    unsorted -= 1
  end
  puts array
end

puts bubble_sort([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]).inspect

bubble_sort_by(["what", "a", "sentence", "of", "words"]) do |left, right|
left.length - right.length
end