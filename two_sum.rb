def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |idx1|
    (idx1 + 1...arr.length).each do |idx2|
      return true if arr[idx1] + arr[idx2] == target_sum
    end
  end
  false
end

## O(n^2)
arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def ok_two_sum?(arr, target) 
  arr = arr.sort #nlogn dominating 
  i = 0 
  j = arr.length - 1 
  while i < j 
    if arr[i] + arr[j] == target 
      return true
    elsif 
      arr[i] + arr[j] > target
      j -= 1 
    else
      i += 1 
    end
  end 
  false 
end 

# O(nlogn)
p ok_two_sum?(arr, 6) # => should be true
p ok_two_sum?(arr, 10) # => should be false

def good_two_sum?(arr, target) 
  dict = Hash.new(0)
  arr.each do |el|
    dict[el] += 1 
  end 
  dict.each do |k,v| 
    other_num = target - k 
    return true if dict.include?(other_num) 
  end 
  false
end 

arr = [0, 1, 5, 7]

p good_two_sum?(arr, 6) # => should be true
p good_two_sum?(arr, 10) # => should be false