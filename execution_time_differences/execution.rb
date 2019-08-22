def my_min1(arr)
  smallest = nil
  (0...arr.length).each do |idx1|
    (idx1 + 1...arr.length).each do |idx2|
      if arr[idx1] < arr[idx2] && (smallest.nil? || arr[idx1] < smallest)
        smallest = arr[idx1]
      elsif arr[idx1] > arr[idx2] && (smallest.nil? || arr[idx2] < smallest)
        smallest = arr[idx2]
      end
    end
  end
  smallest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min1(list)  # =>  -5

## O(n^2)

def my_min2(arr)
  smallest = nil
  arr.each do |ele|
    if smallest.nil? || ele < smallest
      smallest = ele
    end
  end
  smallest
end

p my_min2(list)  # =>  -5

## O(n) 

def largest_contiguous_subsum(list)
  arr = [] 
  (0...list.length).each do |start_idx|
    (start_idx...list.length).each do |end_idx|
      arr << list[start_idx..end_idx]
    end 
  end 
  max = nil  
  arr.each do |subarr|
    if max.nil? || subarr.sum > max 
      max = subarr.sum 
    end 
  end 
  max 
end 

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8

## O(n^3) 


def largest_contiguous_subsum2(list)
  return list.max if list.all? {|n| n < 0}

  max_final = list[0]
  max_temp = list[0]
  (1...list.length).each do |idx|                     
    if max_temp + list[idx] >= 0
      max_temp += list[idx]
    else 
      max_temp = 0
    end
    max_final = max_temp if max_temp > max_final
  end
  
  max_final
end


### 0(n) 




p largest_contiguous_subsum2(list) # => 8

list2 = [-5, -1, -3]
p largest_contiguous_subsum2(list2) # => 8

list3 = [8, -1, 9, -6]
p largest_contiguous_subsum2(list3) 

