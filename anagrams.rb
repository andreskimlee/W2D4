def first_anagram?(string1,string2) 
  string1.split("").permutation(string1.length).to_a.map { |subs| subs.join("")}.include?(string2) 
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# O(n!) 
# gets slower as you increase string length 

def second_anagram?(string1, string2) 
  string1.each_char do |letter|       #O(n)
    index = string2.index(letter)     #O(n) Needs to iterate over string in order to find index hence O(n) 
    if index != nil                   #O(1)               
      string2 = string2[0...index] + string2[index+1..-1]   #O(n)
    else 
      return false
    end
  end 
  return true  
end 

# O(n^2) 



# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(string1, string2) 
  string1.chars.sort == string2.chars.sort 
end 

# O(nlogn)

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(string1, string2) 
  dict = Hash.new(0)

  string1.each_char do |letter|
    dict[letter] += 1 
  end 
 
  string2.each_char do |letter|
    dict[letter] -= 1 
  end

dict.all? { |k, v| v == 0 }

end 

# o(n) 

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

