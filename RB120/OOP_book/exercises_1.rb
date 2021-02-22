## Reverse! an Array without using the reverse! method vs. new array
#-------------------------------------------------------------------------------
=begin
def reverse(ary)
  ary.sort {|left, right| ary.index(right) <=> ary.index(left) }
end


def reverse(ary)
  ary.each_with_object([]) {|item, ary| ary.unshift(item) }
end


def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

def reverse!(list)
  array = []
  array << list.pop until list.empty?
  list << array.shift until array.empty?
  list
end

def reverse!(items)
  temp_list = []
  items.each {|item| temp_list.unshift(item)}
  temp_list.each_with_index {|item, index| items[index] = item}
  items
end

def reverse!(list)
  counter = 1
  list.size.times do
    list[list.size] = list[list.size - counter]
    counter += 1
    list.delete_at(list.size - counter)
  end
  list 
end

def reverse!(arr)
  arr2 = arr.clone
  arr.length.times { |m| list[m} = list2[-m-1] }
  arr
end


def reverse!(list)
  list.sort! { |a, b| list.index(b) <=> list.index(a) }
end




## Prime Numbers
#------------------------------------------------------------------------------

require "prime"

5.prime?


def not_prime?(num)
  return true if num == 1
  (2...num).each do |int|
    return true if num % int == 0
  end
  false
end

def prime?(num)
  return false if num == 1
  (2...num).each do |int|
    return false if num % int == 0
  end
  false
end

## Fibonnaci Numbers
#--------------------------------------------------------------------------
# find index where the given number is the number of digits
def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end




## Remove vowels from array
#------------------------------------------------------------------------------
def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end




##Palindrome (without using the reverse method)
#----------------------------------------------------------------------------



##how to use the next keyword



## Manipulate hashes
#----------------------------------------




##Halvsies - >Easy 6




## Find the duplicate element in an array
def find_dup(arr)
  new_arr = []
  arr.each do |ele|
    if new_arr.include?(ele)
      return ele
    else
      new_arr << ele
    end
  end
end

def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end




## Triangles - Forms

def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********


=end



#"reverse an array without using the built-in reverse method"

#new array
def reverse(arr)
  new_array = []
  idx = -1
  until new_array.size == arr.size
    new_array << arr[idx]
    idx -=1
  end
  new_array
end

#p reverse(%w(a b c d e f g h i j k))

#original array

def reverse_o(arr)
  idx1 = 0
  idx2 = -1

  loop do
    arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
    idx1 += 1
    idx2 -= 1
    break if idx1 > arr.size/2  - 1
  end
end

# example = [1,2,3, 4]
# reverse_o(example)
# p example



#"select (all) element(s) out of the array if its index is a fibonacci number"

def fibonacci_number?(num)
  fibonacci = [1, 1]
  until fibonacci[-1] >= num
    fibonacci << fibonacci[-1] + fibonacci[-2]
  end
  fibonacci.include?(num)
end

def fib_index(arr)
  selection = []
  arr.each_with_index do |num, idx|
    fibonacci_number?(idx) ? selection << num : next
  end
  selection
end

#p fib_index([1, 3, 7, 8, 144])




#"write a method to determine if a word is a palindrome, without using the
#reverse method"

def palindrome?(word)
  reversed = []
  temp = word.dup.chars
  until word.size == reversed.size
    reversed << temp.pop
  end
  word == reversed.join
end





def leading_substrings(string)
  new_arr = []
  substring = ""
  string.chars.each.with_index do |letter, index|
    new_arr << string[0..index]
  end
new_arr
end 

def substrings(string)
  new_arr = []
  counter = 0
  loop do
    string_new = string[counter..-1]
    new_arr << leading_substrings(string_new)
    counter += 1
    break if counter == string.size
  end
  new_arr.flatten
end

def palindrome?(string)
  string == string.reverse
end

def longest_palindrome(string)
 arr = substrings(string)
 new_arr = arr.select do |substring|
  substring if palindrome?(substring) && substring.size > 1
 end
 new_arr.max_by {|word| word.size}
end


def substring_test(string1, string2)
  arr1 = string1.chars.map(&:downcase)
  arr2 = string2.chars
  string2.empty? ? return false : arr2.all? {|x| arr1.include?(x.downcase) }
end

puts substring_test('Something', 'Fun') == false
puts substring_test('Something', 'Home') == true
puts substring_test('Something', ' ') == false
puts substring_test('BANANA', 'banana') == true
puts substring_test('test', 'llt') == false
puts substring_test(' ', ' ') == false
puts substring_test('1234567', '541265') == true

