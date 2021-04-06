def help
  a = 0

  some_proc = Proc.new { some_method { puts a } }

  some_method { puts a } # 0

  a = 1
  some_proc.call # 1
  some_method { puts a } # 1

end
  
  
def some_method
  yield
end


#- ...Encrypted Pioneers
=begin

The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Write a program that deciphers and prints each of these names .

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end


ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
]

def decoding(array)
 array.each do |full_name|
    name = full_name.split.map do |word| 
      word.chars.map do |letter|
        if letter.match?(/[a-m]/i)
          (letter.ord + 13).chr
        else
          (letter.ord - 13).chr
        end
      end.join
    end.join(" ")
    puts name
  end
end

decoding(ENCRYPTED_PIONEERS)
=end



#- Iterators: True for Any?
=begin
A great way to learn about blocks is to implement some of the core ruby methods that use blocks using your own code. Over this exercise and the next several exercises, we will do this for a variety of different standard methods.

The Enumerable#any? method processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a value of true for any element, then #any? returns true. Otherwise, #any? returns false. Note in particular that #any? will stop searching the collection the first time the block returns true.

Write a method called any? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for any of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true.

If the Array is empty, any? should return false, regardless of how the block is defined.

Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

Examples:



def any?(array)
  counter = 0
  loop do
    break if counter == array.size
    return true if yield(array[counter])
    counter += 1
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

=end

=begin

def any?(collection)
  collection.each { |item| return true if yield(item) }
  false
end

def any?(array)
  counter = 0
  while counter < array.size
    return true if yield(array[counter])
    counter += 1
  end
  false
end

=end
#- Iterators: Ture for All?

=begin
In the previous exercise, you developed a method called any? that is similar to the standard Enumerable#any? method for Arrays (our actual solution works with any Enumerable collection). In this exercise, you will develop its companion, all?.

Enumerable#all? processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a value of true for every element, then #all? returns true. Otherwise, #all? returns false. Note in particular that #all? will stop searching the collection the first time the block returns false.

Write a method called all? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for all of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns false.

If the Array is empty, all? should return true, regardless of how the block is defined.

Your method may not use any standard ruby method that is named all?, any?, none?, or one?.



def all?(collection)
  collection.each { |item| return false unless yield(item) }
  true
end


p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true

=end
#- Iterators: True for None?
=begin
In the previous two exercises, you developed methods called any? and all? that are similar to the standard Enumerable methods with the same names. In this exercise, you will develop another of the methods in this family, none?.

Enumerable#none? processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns true for any element, then #none? returns false. Otherwise, #none? returns true. Note in particular that #none? will stop searching the collection the first time the block returns true.

Write a method called none? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns false for all of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true.

If the Array is empty, none? should return true, regardless of how the block is defined.

Your method may not use any of the following methods from the Array and Enumerable classes: all?, any?, none?, one?. You may, however, use either of the methods created in the previous two exercises.



def none?(array)
  counter = 0
  loop do   
    break if counter == array.size
    return false if yield(array[counter])
    counter += 1
  end
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
=end
=begin
def none?(collection)
  collection.each { |item| return false if yield(item) }
  true
end

def none?(collection, &block)
  !any?(collection, &block)
end

The key to this solution is that #none? is merely the opposite of #any?. #any? returns true if the collection contains any matches, false if does not. #none? returns true if the collection does not contain any matches, false if does.

The easiest way to accomplish this is to just modify the #any? method we wrote earlier; instead of returning true from the #each loop, we return false; instead of returning false after the loop, we return true.

However, since #none? is effectively the negation of #any?, you would think that we can write:

Copy Code
def none?(collection)
  !any?(collection)
end
However, this fails with a:

Copy Code
no block given (yield) (LocalJumpError)
error message. The reason for this is that blocks aren't passed down the calling chain by default. Instead, you need to explicitly pass the block to #any?; to do that, #none? must require a block argument with an & as shown in the alternate solution. We then pass &block to any?, where it is treated as if the call to any? included the block.


=end
#- Iterators: True for One?
=begin
In the previous 3 exercises, you developed methods called any?, all?, and none? that are similar to the standard Enumerable methods of the same names. In this exercise, you will develop one last method from this family, one?.

Enumerable#one? processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a value of true for exactly one element, then #one? returns true. Otherwise, #one? returns false. Note in particular that #one? will stop searching the collection the second time the block returns true.

Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true a second time.

If the Array is empty, one? should return false, regardless of how the block is defined.

Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

def one?(array)
  results = []
  array.each do |item|
    results << item if yield(item)
  end
  results.size == 1 ? true : false
end

## -> violates the condition that it shuold stop processing as soon as it finds a second element


p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false
=end

=begin
def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

def one?(collection)
  true_count = 0
  collection.each do |obj|
    true_count += 1 if yield(obj)
    return false if true_count > 1
  end
  true_count == 1
end
=end
#- Count Items
=begin
Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array element passed to it. The method should return a count of the number of times the block returns true.

You may not use Array#count or Enumerable#count in your solution.

Examples:



def count(array)
  counting = 0
  array.each do |element|
    counting += 1 if yield(element)
  end
  counting
end



## Further Exploration -> Method without each, loop, while, or until
def count(array)
  array.select do |element|
    yield(element)
  end.size
end


p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

=end
=begin

def count(array)
  total = 0
  array.each { |value| total += 1 if yield value }
  total
end

Discussion
Our solution works by iterating over the values in array, incrementing a counter by 1 each time the block returns true when yielded the current value.

Further Exploration
Write a version of the count method that meets the conditions of this exercise, but also does not use each, loop, while, or until.
=end

#- Easy 2
#-----------------------------------------------------------------------------------------------------------------------------------
 #   - From-To-Step Sequence Generator
=begin
The Range#step method lets you iterate over a range of values where each value in the iteration is the previous value plus a "step" value. It returns the original range.

Write a method that does the same thing as Range#step, but does not operate on a range. Instead, your method should take 3 arguments: the starting value, the ending value, and the step value to be applied to each iteration. Your method should also take a block to which it will yield (or call) successive iteration values.

Example:
step(1, 10, 3) { |value| puts "value = #{value}" }

value = 1
value = 4
value = 7
value = 10


def step(start, stop, step)
  num = start

  until num > stop
    yield(num)
    num += step
  end 
end


def step(start, stop, step)
  num = start
  while num <= stop
    yield(num)
    num += step
  end
end

def step(starting, ending, step)
  (starting..ending).each_with_index do |n, idx|
    yield(n) if (idx % step).zero?
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }

=end
=begin
def step(start_point, end_point, increment)
  current_value = start_point
  loop do
    yield(current_value)
    break if current_value + increment > end_point
    current_value += increment
  end
  current_value
end

In this solution start_point is where we begin, end_point is the maximum value to step up to, and increment is the amount we want to step by on each iteration.

current_value is yielded to the block and then incremented on each iteration. We do not want to step beyond end_point, so we exit the loop when current_value + increment > end_point. Finally, we return current_value.

There's no particular reason why we choose to return current_value other than the fact that it is a reasonably sensible value. Range#step returns self (this is, the original Range object), but that doesn't work for us. Another reasonable return value might be nil, or perhaps the last value returned by the block.

=end
  #  - Zipper

=begin

he Array#zip method takes two arrays, and combines them into a single array in which each element is a two-element array where the first element is a value from one array, and the second element is a value from the second array, in order. For example:

Copy Code
[1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
Write your own version of zip that does the same type of operation. It should take two Arrays as arguments, and return a new Array (the original Arrays should not be changed). Do not use the built-in Array#zip method. You may assume that both input arrays have the same number of elements.

Example:

Copy Code
zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

def zip(array1, array2)
  result = []
  array1.each_with_index do |num1, index1|
    array2.each_with_index do |num2, index2|
      result << [num1, num2] if index1 == index2
    end
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

=end
=begin

def zip(array1, array2)
  result = []
  index = 0
  length = array1.length
  while index < length
    result << [array1[index], array2[index]]
    index += 1
  end
  result
end
Discussion
In ruby, the hardest part of dealing with two arrays simultaneously is determining how to iterate through those arrays. Almost all of the Array and Enumerable methods only work on one array at a time. Often, the easiest approach is to simply use a loop and two indexes, one that indexes the first array, and one that indexes the second. Fortunately, in this exercise, we have two arrays of equal size, and each time we access the same index, so we can reduce those two indexes to just one.

Once you've settled on the approach, writing the code itself can be easy; this is one such case. All we need to do is set up our result array, initialize the index, iterate, then return the result.

The iteration part of this process is where everything of true importance happens. For this problem, we iterate N times, where N is the number of elements in each of our two arrays. Then, during each iteration, we append the appropriate elements, as a two element Array, to our result array, and increment the index.

This can be simplified somewhat by recognizing that this loop is pretty much what Array#each_with_index does, so we use that:

Copy Code
def zipper(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << [element, array2[index]]
  end
  result
end
or, even more succintly,

Copy Code
def zipper(array1, array2)
  array1.each_with_index.with_object([]) do |(element, index), result|
    result << [element, array2[index]]
  end
end
=end

  #  - map
=begin

Lets return to implementing existing core ruby methods to learn about blocks.

The Enumerable#map method iterates over the members of a collection, using the associated block to perform some sort of operation on each collection member. The returned values from the block are then built up into an Array that is then returned to the caller. Note in particular that every time #map yields to the block, it obtains just one value. That value may be a complex value - it may even be another collection - but it is nevertheless just one value. Thus, #map returns an Array that has the same number of elements that the original collection had.

Write a method called map that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return a new Array that contains the return values produced by the block for each element of the original Array.

If the Array is empty, map should return an empty Array, regardless of how the block is defined.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

Examples:

Copy Code


def map(array)
  result = []
  array.each do |item|
    result << yield(item)
  end
  result
end


p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

=end

=begin
=end
  #  - count


=begin
NOTE: This exercise was originally a duplicate from the previous exercise set. We have modified it slightly, but some of the posted solutions still reflect the original wording.

The Enumerable#count method iterates over the members of a collection, passing each element to the associated block. It then returns the number of elements for which the block returns a truthy value.

Write a method called count that behaves similarly for an arbitrarily long list of arguments. It should take 0 or more arguments and a block, and then return the total number of arguments for which the block returns true.

If the argument list is empty, count should return 0.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

Examples:


def count(num1=nil, num2=nil, num3=nil)
  result = []
  result << num1 unless num1 == nil
  result << num2 unless num2 == nil
  result << num3 unless num3 == nil

  result.each_with_object([]) do |ele, obj|
    obj << ele if yield(ele)
  end.size


end


p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3

=end
=begin

def count(*arguments)
  total = 0
  arguments.each { |item| total += 1 if yield(item) }
  total
end

=end

  #  - drop_while
=begin
The Enumerable#drop_while method begins by iterating over the members of a collection, passing each element to the associated block until it finds an element for which the block returns false or nil. It then converts the remaining elements of the collection (including the element that resulted in a falsey return) to an Array, and returns the result.

Write a method called drop_while that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return all the elements of the Array, except those elements at the beginning of the Array that produce a truthy value when passed to the block.

If the Array is empty, or if the block returns a truthy value for every element, drop_while should return an empty Array.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

Examples:



def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end
  array[index..-1]
end

def drop_while(arr)
  arr.each_with_index do |ele, i|
    return arr[i..-1] unless yield(ele)
  end
  []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } #== []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

=end
=begin

While we could use each or each_with_index, our solution employs a simple while loop instead; while makes it obvious that we want to stop prematurely, since we know that we may not be iterating through the entire Array.

Once we've skipped over the elements for which the block returns true, all we need to do is extract the remaining elements from the Array, which we do with array[index..-1]; this slicing syntax extracts a slice of the Array starting at index, and ending with the final element at index -1.
=end
  #  - each_with_index
=begin
The Enumerable#each_with_index method iterates over the members of a collection, passing each element and its index to the associated block. The value returned by the block is not used. each_with_index returns a reference to the original collection.

Write a method called each_with_index that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should yield each element and an index number to the block. each_with_index should return a reference to the original Array.

Your method may use #each, #each_with_object, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

Examples:

Copy Code
result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
should output:

Copy Code
0 -> 1
1 -> 3
2 -> 36
true


def each_with_index(array)
  index = 0
  array.each do |item|
    yield(item, index)
    index += 1
  end
end
Discussion
Our solution is simple enough: it uses each to iterate through the Array, while maintaining an index value that can be passed with the element value to the block.

At first glance, it might seem that we're missing a bit here: where's the return value? As usual, every statement in Ruby returns a value, and every method returns the value returned by the last statement executed. In this case, the last statement executed is the each loop, and each returns the Array it is used on, so the return value is array; just what we need.


=end
  #  - each_with_object
=begin
The Enumerable#each_with_object method iterates over the members of a collection, passing each element and an arbitrary object (usually a collection) to the associated block. The value returned by the block is not used. The object that is passed to the block is defined as an argument to each_with_object; with each iteration, this object may be updated by the block. When iteration is complete, the final value of the object is returned.

Write a method called each_with_object that behaves similarly for Arrays. It should take an Array and an object of some sort as an argument, and a block. It should yield each element and the object to the block. each_with_object should return the final value of the object.

If the Array is empty, each_with_object should return the original object passed as its second argument.

Your method may use #each, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

Examples:

Copy Code
result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
result == {}


=end
=begin
def each_with_object(array, object)
  array.each { |item| yield(item, object) }
  object
end
Discussion
Implementing this method is easier than it sounds. All that stuff about the "object" makes it sound harder than it really is. In fact, all we need to do with that object is yield it (along with the element value) to our block for each element of the Array. At the end, we just need to make sure we return that object.

=end
  #  - max_by
=begin
The Enumerable#max_by method iterates over the members of a collection, passing each element to the associated block. It then returns the element for which the block returned the largest value.

Write a method called max_by that behaves similarly for Arrays. It should take an Array and a block, and return the element that contains the largest value.

If the Array is empty, max_by should return nil.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

Examples:

Copy Code
max_by([1, 5, 3]) { |value| value + 2 } == 5
max_by([1, 5, 3]) { |value| 9 - value } == 1
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
max_by([-7]) { |value| value * 3 } == -7
max_by([]) { |value| value + 5 } == nil


=end
=begin
def max_by(array)
  return nil if array.empty?

  max_element = array.first
  largest = yield(max_element)

  array[1..-1].each do |item|
    yielded_value = yield(item)
    if largest < yielded_value
      largest = yielded_value
      max_element = item
    end
  end

  max_element
end
Discussion
The first part of our solution simply handles the edge case of an empty Array. According to the requirements, we just need to return nil for an empty Array, so that's what we've done.

The rest of the exercise has two tricky parts: first, we need to select a reasonable initial value to be compared against each block return value, then we need to iterate over the Array while keeping track of both the largest value returned by the block, and the value of the element associated with that largest value.

The first part isn't too bad. Obviously, 0 won't work as the largest value: it would cause the fifth test to fail since -7 < 0. We could also try -Float::INFINITY, which would work in most cases, but what happens if the block returns something other than a number? For instance, our 3rd example has a block that returns Strings, which can't be successfully compared against -Float::INFINITY. The answer is to pass the first item in the Array to the block, and then use the return value as the initial largest value.

The second tricky part also isn't too bad; all we need to do is remember which element returned the largest value to date. We track this element in max_element, which we initialize to the first element of the Array.

Once this plan is in place, all we need to do is iterate through the remaining Array elements and find the largest block return value and its associated element.

=end
  #  - each_cons (Part1)
=begin
The Enumerable#each_cons method iterates over the members of a collection taking each sequence of n consecutive elements at a time and passing them to the associated block for processing. It then returns a value of nil.

Write a method called each_cons that behaves similarly for Arrays, taking the elements 2 at a time. The method should take an Array as an argument, and a block. It should yield each consecutive pair of elements to the block, and return nil.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

Examples:

Copy Code
hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
hash == {}
result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
hash == {'a' => 'b'}
result == nil

=end
=begin
def each_cons(array)
  array.each_with_index do |item, index|
    break if index + 1 >= array.size
    yield(item, array[index + 1])
  end
  nil
end
Discussion
The hardest part of this exercise is trying to decide when to stop iterating. Obviously, we can't simply iterate over the entire Array, since there are no elements with which to pair the last element if we did. Instead, we need to stop when the current element is the last element, which we can detect by comparing the value of index + 1 against the Array size.

=end
  #  - each_cons (Part2)
=begin

In the previous exercise, we wrote a method that emulates Enumerable#each_cons, but limited our method to handling 2 elements at a time. Enumerable#each_cons can actually handle any number of elements at a time: 1, 2, 3, or more.

Update your each_cons method so it takes an argument that specifies how many elements should be processed at a time.

Your method may use #each, #each_index, #each_with_object, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

Examples:

Copy Code
hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
hash == {}

=end
=begin

def each_cons(array, n)
  array.each_index do |index|
    break if index + n - 1 >= array.size
    yield(*array[index..(index + n - 1)])
  end
  nil
end
Discussion
This exercise would be pretty hard if you hadn't already done the bulk of the work in the previous exercise. Even so, it can be tricky.

As before, you need to know when to stop iterating. This can be handled pretty easily by realizing that the previous exercise just had n == 2, and we stopped processing when index + 1, or index + 2 - 1 was greater than or equal to the Array size. This translates pretty naturally to testing whether index + n - 1 is greater than or equal to the Array size.

Slightly trickier is passing a variable number of elements to the block; we do this using the "splat" operator (*) together with a slice of the array that covers n elements starting at the current index.

=end
#- Easy Testing
#-----------------------------------------------------------------------------------------------------------------------------------
 #   - Boolean Assertions
=begin
Write a minitest assertion that will fail if the value.odd? is not true.
=end
=begin

assert value.odd?, 'value is not odd'
Discussion
#assert tests whether its first argument is truthy (that is, it is neither false nor nil). If the first argument is not truthy, the test fails, and the second argument is displayed as the failure message.

Most (but not all) of the minitest assertions let you specify a failure message as the final argument. This is frequently omitted since the error messages provided by default are usually sufficient. However, the default message for assert lacks context, so it is common to specify the failure message when using assert.

assert isn't used directly in most tests since it is usually more important to ensure an exact value is returned; if you want to know that your method returns true and not just a truthy value, assert_equal is a better choice. For example:

Copy Code
assert_equal true, value.odd?

=end
 #   - Equality Assertions
=begin
Write a minitest assertion that will fail if value.downcase does not return 'xyz'
=end
=begin
assert_equal 'xyz', value.downcase
Discussion
#assert_equal tests whether its first two arguments are equal using #==. Failure messages issued by #assert_equal assume that the first argument represents the expected value, while the second argument represents the actual value to be tested. It's important to maintain this convention so that failure messages make sense.

=end
 #   - Nil Assertions
=begin
Write a minitest assertion that will fail if value is not nil.

=end
=begin
assert_nil value
Discussion
#assert_nil tests whether its first argument is nil. You can use:

Copy Code
assert_equal nil, value
instead, but #assert_nil is clearer and issues a better failure message.

=end
 #   - Empty Object Assertions
=begin
Write a minitest assertion that will fail if the Array list is not empty.
=end
=begin

Solution
Copy Code
assert_empty list
Discussion
#assert_empty tests whether its first argument responds to the method #empty? with a true value. You can use:

Copy Code
assert_equal true, list.empty?
instead, but #assert_empty is clearer and issues a better failure message.
=end
 #   - Included Object Assertions
=begin
Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
=end
=begin
assert_includes list, 'xyz'
Discussion
#assert_includes tests whether its first argument contains the second argument. You can use:

Copy Code
assert_equal true, list.include?('xyz')
instead, but #assert_includes is clearer and issues a better failure message.

=end
 #   - Exception Assertions
=begin
Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.
=end
=begin
assert_raises NoExperienceError do
  employee.hire
end
Discussion
#assert_raises checks if the given block raises an exception of the named type. If it does not, the assertion fails.
=end
 #   - Type Assertions
=begin
Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.

=end
=begin
assert_instance_of Numeric, value
Discussion
#assert_instance_of uses Object#instance_of? to ensure that its second argument is an instance of the class named as its first argument.
=end
 #   - Kind Assertions
=begin
Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).
=end
=begin
assert_kind_of Numeric, value
Discussion
#assert_kind_of uses Object#kind_of? to check if the class of its second argument is an instance of the named class or one of the named class's subclasses.
=end
 #   - Same Object Assertions
=begin
Write a test that will fail if list and the return value of list.process are different objects.
=end
=begin
assert_same list, list.process
Discussion
#assert_same tests whether its first and second arguments are the same object, as determined by #equal?
=end
 #   - Refutations
=begin
Write a test that will fail if 'xyz' is one of the elements in the Array list:
=end
=begin
refute_includes list, 'xyz'
Discussion
Most minitest assertions have a corresponding refutation method that fails if the indicated condition is true: refute_equal is the opposite of assert_equal, refute_kind_of is the opposite of assert_kind_of, etc. Thus, the refutation of assert_includes is refute_includes.
=end
#- Medium 1
#-----------------------------------------------------------------------------------------------------------------------------------
#    - Listening Device
=begin
Below we have a listening device. It lets us record something that is said and store it for later use. In general, this is how the device should be used:

Listen for something, and if anything is said, record it for later use. If nothing is said, then do not record anything.

Copy Code
class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end
end
Anything that is said is retrieved by this listening device via a block. If nothing is said, then no block will be passed in. The listening device can also output the most recent recording using a Device#play method.

Copy Code
listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
Finish the above program so that the specifications listed above are met.
=end
=begin
class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    return unless block_given?
    recording = yield
    record(recording)
  end

  def play
    puts @recordings.last
  end
end
Discussion
We can see what needs to be implemented if we compare the code from the last code block of the description with the code given for our Device class.

It seems we are missing a Device#listen method and a Device#play method. In our solution, we implement the Device#listen method by yielding to a block, and then we record what was in that block if necessary.

Notice that we include return unless block_given? to handle the situation where a block is not provided to Device#listen. Without this line, we will get a LocalJumpError. Using block_given? to check for a block is needed when blocks are optional.

We're using a guard clause in our listen method to handle the no-block case, but we could also write code that is functionally identical like so:

Copy Code
def listen
  recording = yield if block_given?
  record(recording) if recording
end
For our play method, we make sure to output what was last recorded using puts @recordings.last.

If nothing has been recorded, then we output nothing. And if there was something recorded, then that string will be the output from this Device#play method.
=end
#    - Text Analyzer - Sandwhich Code
=begin
Fill out the rest of the Ruby code below so it prints output like that shown in "Sample Output." You should read the text from a simple text file that you provide. (We also supply some example text below, but try the program with your text as well.)

This question requires that you read a simple text file. Try searching the Web for information on how to do this, and also take a look at the File class in the Ruby documentation. If you can't figure it out on your own, don't worry: just put the data directly into your program; an Array with one element per line would be ideal.

Read the text file in the #process method and pass the text to the block provided in each call. Everything you need to work on is either part of the #process method or part of the blocks. You need no other additions or changes.

The text you use does not have to produce the same numbers as the sample output but should have the indicated format.

Copy Code
class TextAnalyzer
  def process
    # your implementation
  end
end

analyzer = TextAnalyzer.new
analyzer.process { # your implementation }
analyzer.process { # your implementation }
analyzer.process { # your implementation }
Sample Text File:

sample_text.txtCopy Code
Eiusmod non aute commodo excepteur amet consequat ex elit. Ut excepteur ipsum
enim nulla aliqua fugiat quis dolore do minim non. Ad ex elit nulla commodo
aliqua eiusmod aliqua duis officia excepteur eiusmod veniam. Enim culpa laborum
nisi magna esse nulla ipsum ex consequat. Et enim et quis excepteur tempor ea
sit consequat cupidatat.

Esse commodo magna dolore adipisicing Lorem veniam quis ut labore pariatur quis
aliquip labore ad. Voluptate ullamco aliquip cillum cupidatat id in sint ipsum
pariatur nisi adipisicing exercitation id adipisicing qui. Nulla proident ad
elit dolore exercitation cupidatat mollit consequat enim cupidatat tempor
aliqua ea sunt ex nisi non.

Officia dolore labore non labore irure nisi ad minim consectetur non irure
veniam dolor. Laboris cillum fugiat reprehenderit elit consequat ullamco veniam
commodo.
Sample Output:

Copy Code
3 paragraphs
15 lines
126 words
=end
=begin
You may assume that paragraphs have one empty line between them and that each line ends with a newline character. A single space appears between all words.

Solution
Copy Code
class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }
Discussion
For this exercise, you must fill in the missing parts of the code we gave you. You know the output we want; you must somehow produce that output.

Start with the #process method; we told you that #process should read some text from a file, and then pass that text to the block for further processing. The usual approach for such read-and-process code looks like this:

Copy Code
file = File.open('sample_text.txt', 'r')
# do processing here
file.close
Remember to always close files when you finish using them.

Since we're supposed to pass the text content of the file to the block, we must load the file's content and call the block, which we do with yield(file.read):

Copy Code
file = File.open('sample_text.txt', 'r')
yield(file.read)
file.close
At this point we have what we call "sandwich code"; it performs some pre- and post-processing for some arbitrary action. Here, the pre-processing opens a file, and the post-processing closes it. Together, they sandwich the action that loads the file's contents and passes it to a block.

Since we're passing text to the blocks, the blocks should capture that text:

Copy Code
analyzer.process { |text| puts ... }
analyzer.process { |text| puts ... }
analyzer.process { |text| puts ... }
Judging from the partial code, you can see that each block contains a puts statement, so we must provide arguments to puts that perform the necessary processing and format the answer accordingly. The last step fills in these details: for each, we use String#split and Array#count as you can see in the Solution.
=end
#    - Passing Parameters Part 1
=begin
Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.

Copy Code
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts "#{items.join(', ')}"
  puts "Nice selection of food we have gathered!"
end





items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts produce.join('; ') }
Discussion
To accomplish our task, we need to yield the items array to a block. Moving the implementation of our items formatting to a block gives the user more flexibility and choice for how they wish to use gather. By yielding items to a block, the user can join those items for presentation purposes or they can choose a completely different representation For example:

Copy Code
gather(items) do |produce|
  puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end

=end
#    - Passing Parameters Part 2
=begin
Ruby gives us a lot of flexibility when assigning arrays to variables. If we want to assign the entire array to a single variable, we can do that:

Copy Code
birds = %w(raven finch hawk eagle)
p birds # => ['raven','finch','hawk','eagle']
If we want to assign every element to a separate variable, we can do that too:

Copy Code
raven, finch, hawk, eagle = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p hawk # => 'hawk'
p eagle # => 'eagle'
Suppose we want to organize our array contents into groups, where variables represent category names. Can we do that without extracting items directly from the array based on their indices?

We can use the splat operator(*) to do something like this:

Copy Code
raven, finch, *raptors = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p raptors  # => ['hawk','eagle']
Based on the examples shown above, write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block variables in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.

=end
=begin

Ruby treats block variables in much the same way that it does during assignment from an array. In fact, you can use the splat operator to collect items into an Array.

Solution
Copy Code
birds = ['crow', 'finch', 'hawk', 'eagle']

def types(birds)
  yield birds
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end
Discussion
For our solution, we start with an array named birds. It contains four birds, where two of them are raptors. Above we use our block variables to organize it further. When we yield birds to the block, Ruby assigns the individual elements of birds to the different block variables. It assigns the first two birds, "crow" and "finch," to _; the underscore tells Ruby that we aren't interested in those values. The splat operator on the name block variable tells Ruby to treat it as an Array and assign all remaining arguments to it. Here, we group the last two elements from birds into the array, raptors.

For demonstration purposes, we join the two array elements and output them to the screen as:

Raptors: hawk, eagle

=end
#    - Passing Parameters Part 3
=begin
Given this code:

Copy Code
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end
Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:

1)

Copy Code
gather(items) do | , |
  puts
  puts
end
Copy Code
Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!
2)

Copy Code
gather(items) do | , , |
  puts
  puts
  puts
end
Copy Code
Let's start gathering food.
apples
corn, cabbage
wheat
We've finished gathering!
3)

Copy Code
gather(items) do | , |
  puts
  puts
end
Copy Code
Let's start gathering food.
apples
corn, cabbage, wheat
We've finished gathering!
4)

Copy Code
gather(items) do | , , , |
  puts
end
Copy Code
Let's start gathering food.
apples, corn, cabbage, and wheat
We've finished gathering!
=end
=begin

Approach/Algorithm
When calling a method that takes a block, its block parameters can affect how information is referenced in that method call. Here is how many lines of code each numbered problem(1-4) potentially requires:

4 lines
5 lines
4 lines
3 lines
Make sure to use what you've learned from the previous two exercises about the splat operator. That information will be key here.

Solution
Copy Code
# 1
gather(items) do |*produce, wheat|
  puts produce.join(', ')
  puts wheat
end

# 2
gather(items) do |apples, *vegetables, wheat|
  puts apples
  puts vegetables.join(', ')
  puts wheat
end

# 3
gather(items) do |apples, *assorted|
  puts apples
  puts assorted.join(', ')
end

# 4
gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
Discussion
This isn't necessarily just an exercise related to blocks, but how Ruby handles passing parameters in different situations. We can make equivalent code that gives us the same output, if we make changes to gather method for each numbered problem(1-4).

Copy Code
# 1
def gather(*produce, wheat)
  puts "Let's start gathering food."
  p produce
  puts wheat
  puts "We've finished gathering!"
end

# 2
def gather(apples, *vegetables, wheat)
  puts "Let's start gathering food."
  puts apples
  p vegetables
  puts wheat
  puts "We've finished gathering!"
end

# 3
def gather(apples, *assorted)
  puts "Let's start gathering food."
  puts apples
  p assorted
  puts "We've finished gathering!"
end

# 4
def gather(apples, corn, cabbage, wheat)
  puts "Let's start gathering food."
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
  puts "We've finished gathering!"
end

# method call

gather(*items) # notice we need a splat operator for passing in that array now.
The calls for outputting our variables are the same, we can even move the block parameters and make them our method parameters. For calling this new gather method, we have to use *items instead of just items as an argument. Using *items passes each array element as a list of items instead of a bundled array of items. Having to define four different methods though is cumbersome, using a block gives us much more flexibility on how we want to group our output.

This has also shown us a key difference between how arrays are passed as parameters either to a block or a method. When yielded to a block, an array's individual elements will get converted to a list of items if the block parameters call for that conversion(such as when we have parameters like |apples, *assorted|).

When passing an array to a method, we need to be explicit in how we pass it. If we want to change that array into a list of items, we'll have to do so with the splat operator *. Overall, it seems like using a block was the right way to go, it allows us more flexibility and leaves the implementation of gather to the user.

=end
#    - Method to Proc
=begin

In our Ruby course content on blocks, we learn about "symbol to proc" and how it works. To review briefly, consider this code:

Copy Code
comparator = proc { |a, b| b <=> a }
and the Array#sort method, which expects a block argument to express how the Array will be sorted. If we want to use comparator to sort the Array, we have a problem: it is a proc, not a block. The following code:

Copy Code
array.sort(comparator)
fails with an ArgumentError. To get around this, we can use the proc to block operator & to convert comparator to a block:

Copy Code
array.sort(&comparator)
This now works as expected, and we sort the Array in reverse order.

When applied to an argument object for a method, a lone & causes ruby to try to convert that object to a block. If that object is a proc, the conversion happens automatically, just as shown above. If the object is not a proc, then & attempts to call the #to_proc method on the object first. Used with symbols, e.g., &:to_s, Ruby creates a proc that calls the #to_s method on a passed object, and then converts that proc to a block. This is the "symbol to proc" operation (though perhaps it should be called "symbol to block").

Note that &, when applied to an argument object is not the same as an & applied to a method parameter, as in this code:

Copy Code
def foo(&block)
  block.call
end
While & applied to an argument object causes the object to be converted to a block, & applied to a method parameter causes the associated object to be converted to a proc. In essence, the two uses of & are opposites.

Did you know that you can perform a similar trick with methods? You can apply the & operator to an object that contains a Method; in doing so, Ruby calls Method#to_proc.

Using this information, together with the course page linked above, fill in the missing part of the following code so we can convert an array of integers to base 8 (octal numbers). Use the comments for help in determining where to make your modifications, and make sure to review the "Approach/Algorithm" section for this exercise; it should prove useful.

Copy Code
def convert_to_base_8(n)
  n.method_name.method_name # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(argument).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
[8, 10, 12, 14, 16, 33].map(&a_proc)
The expected return value of map on this number array should be:

Copy Code
[10, 12, 14, 16, 20, 41]
You don't need a deep understanding of octal numbers -- base 8 -- for this problem. It's enough to know that octal numbers use the digits 0-7 only, much as decimal numbers use the digits 0-9. Thus, the octal number 10 is equivalent to the decimal number 8, octal 20 is the same as decimal 16, octal 100 is the same as decimal 64, and so on. No math is needed for this problem though; see the Approach/Algorithm section for some hints.

=end
=begin

To solve this problem you'll need to do a bit of research. Refer to this page on the Integer class instance method, to_s. You will also have to use one method from the Object class. For that, check out this documentation page.

NOTE: This exercise is tricky. If you can't finish it, feel free to follow along with the solution; it may be treated as a learning experience rather than something you should be able to figure out on your own.

Solution
Copy Code
def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc

[8, 10, 12, 14, 16, 33].map(&base8_proc) # => [10, 12, 14, 16, 20, 41]
Discussion
Let's start with our convert_to_base_8 method. Notice that this method takes a number-like argument, n. We also see that to_s(n) is using a number-like argument as well. This seems like a good place to start. We'll find that this form of to_s converts integers into the String representation of a base-n number.

Right now, we use decimals (base 10), so to convert a number n to base 8, we call to_s(8) on it. If we take 8 as an example, then calling 8.to_s(8) returns "10". But, from the expected return value, we can see that we want an Integer, not a String. Therefore, we also need to call to_i on the return value of n.to_s(8).

Next, let's handle the missing pieces of this line:

Copy Code
base8_proc = method(argument).to_proc
Based on the information from the "Approach/Algorithm" section, we know to research method from class Object. After looking at that documentation, we see that a symbol of an existing method may be passed into method method(sym). If we do that, the functionality of that method gets wrapped in a Method object, and we may now do work on that object.

We want to convert our array of numbers to base 8, so it makes sense to make a method object out of the convert_to_base_8 method. This leaves us with:

Copy Code
base8_proc = method(:convert_to_base_8).to_proc
The final piece of this exercise asks us fill in this line. [8,10,12,14,16,33].map(&a_proc). We want access to the functionality of method convert_to_base_8, and we know that it has been converted to a Proc object, so that Proc is the natural choice. Remember that using just & (and not &:) lets us turn a Proc object to a block. A block that can now be used with map.

There. All done. One last piece of information that may be good to mention is how a method looks when converted to a Proc. You can imagine the conversion to look like that:

Copy Code
def convert_to_base_8(n)
  n.to_s(8).to_i
end

# ->

Proc.new { |n| n.to_s(8).to_i }
#when we use & to convert our Proc to a block, it expands out to...

# ->
[8, 10, 12, 14, 16, 33].map { |n| n.to_s(8).to_i }

=end
#    - Bubble Sort with Blocks
=begin
In an earlier exercise, you were asked to construct a #bubble_sort! method that used the bubble sort algorithm to sort Arrays in place. Our solution was this:

Copy Code
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end
The problem with this solution is that it doesn't give you any freedom in terms of the criteria used for the sort. For example, perhaps you want to sort the Array in reverse order from usual, or perhaps you want to sort a list of names in a case-insensitive manner.

Your task in this assignment is to modify #bubble_sort! so it takes an optional block that determines which of two consecutive elements will appear first in the results.

If you still have a copy of your #bubble_sort! method, you may use that method as the basis for this exercise. Otherwise, you can use the above solution.

Examples:

Copy Code
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)

=end
=begin
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      else
        next if array[index - 1] <= array[index]
      end

      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end
Discussion
Our solution is nearly identical to the original solution. The only difference is that we have to yield two elements to the block if it was provided. If no block is given, we just compare two elements, and use that to determine if the two elements need to be swapped.

We use Kernel#block_given? to determine whether a block was provided to the method. If it returns true, a block was provided; otherwise, a block wasn't provided.

Regardless of whether a block is provided, we need to compare two elements -- the previous element in the Array, and the current element, based on the index variable. If no block is given, we can compare the values directly using <=; otherwise, we need to yield both elements to the block, and examine the return value of the block.

This technique of tweaking a general purpose method by passing it a block is quite common. For instance, the Enumerable#sort method usually used to sort Arrays accepts an optional block that can be used to modify the desired sort sequence. Similarly, Enumerable#max and Enumerable#min take optional blocks to determine how elements of a collection are compared when determining the maximum and minimum values.

Further Exploration
Modify your solution so it only passes one element to the block at a time; the block should perform some sort of transformation to the argument, and #bubble_sort! itself should just use <= to compare two values. In other words, you should be able to call #bubble_sort! like this:

Copy Code
array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)
=end
#- Medium 2: Testing
#-----------------------------------------------------------------------------------------------------------------------------------
#    - Classes to Test - Cash Register and Transaction
=begin

These will be the classes you will be testing throughout the remaining exercises. You'll want to create two new files, one for each of the two classes listed below. You'll need this code for the remaining exercises of this set.

Copy Code
# cash_register.rb

class CashRegister
  attr_reader :total_money

  def initialize(total_money)
    @total_money = total_money
  end

  def change(transaction)
    transaction.amount_paid - transaction.item_cost
  end

  def give_receipt(transaction)
    puts "You've paid $#{transaction.item_cost}."
  end

  def accept_money(transaction)
    @total_money += transaction.amount_paid
  end

  def start_transaction(transaction)
    transaction.prompt_for_payment
    accept_money(transaction)
    change(transaction)
    give_receipt(transaction)
  end
end
Copy Code
# transaction.rb

class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end

  def prompt_for_payment
    loop do
      puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = gets.chomp.to_f
      break if valid_payment? && sufficient_payment?
      puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

  private

  def valid_payment?
    amount_paid > 0.0
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end
end

=end
=begin
=end
#    - Setup the Test Class - Cash Register
=begin
Let's start things from the ground up. We want to make a simple test suite for our CashRegister class. Setup the initial testing file. You don't have to have any tests in your test file. For this exercise, write everything you would need to start testing CashRegister, excluding the tests themselves (necessary requires, test class, etc.).



=end
=begin
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
end
Discussion
Here's what we need to set up our test class for CashRegister. First, we need to require all necessary libraries and files. "minitest/autorun" is first on the list, as this is the library that will give us access to certain parts of the minitest framework that we need. We also need to require the class we want to test and any classes it depends on. In this case, we want to test CashRegister, but that class depends on collaboration with the Transaction class. We've put those two classes in their own separate files, so two relative requires are necessary to gain access to both classes. Finally, we have to set up the correct testing class. By minitest convention, we'll be naming this class "Class name we want to test"Test: this ends up being, CashRegisterTest. We also have to make sure that our test class subclasses from Minitest::Test. This is a very important step, since if we didn't include this inheritance, then this would be a plain Ruby class and not a test class.
=end
#    - Test Accept Money Method - Cash Register
=begin
We now have the foundation of our CashRegister test class set up. Let's start testing! We'll start with the CashRegister#accept_money method. Write a test for the #accept_money method.
=end
=begin

For this test, make sure that #accept_money properly changes the amount of money returned by #total_money.` You'll also have to setup the necessary objects to test that this method is working as intended.

Solution
Copy Code
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end
end
Discussion
When you first consider this test, it may seem really simple to write. Yet, there is quite a bit of groundwork to lay here. First, we need to create some objects to test the #accept_money method. #accept_money is a method from class CashRegister, so we'll need an instance of that class. We also need an instance of class Transaction. The method #accept_money takes a Transaction object as an argument.

Once we have our objects, we then set the amount_paid via the attr_accessor in the Transaction class. This is the value we'll be checking. If our method does work as intended, then when we process a transaction, the amount in register should increase exactly by the amount paid.

We test this value by setting variables that represent the money in the register before and after a transaction takes place. Finally, we implement the approach/algorithm for this exercise with our assertion: assert_equal previous_amount + 20, current_amount. This assertion does indeed pass, and we have finished testing our accept money method.

=end
#    - Test Change method - Cash Register
=begin

Write a test for the method, CashRegister#change.

=end
=begin

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

# Other tests omitted for brevity

class CashRegisterTest < Minitest::Test
  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(30)
    transaction.amount_paid = 40

    assert_equal 10, register.change(transaction)
  end
end
Discussion
For this test we set up our initial objects, one CashRegister object and one Transaction object. We also make sure to set the amount paid. Recall, that in the last exercise we set it up so that the amount paid and the transaction cost were the same.
In this case, we instead pay 40 dollars for a 30 dollar item. Hopefully we'll be getting some money back! We test the actual functionality of our CashRegister#change method with the assertion: assert_equal 10, register.change(transaction).
We're expecting our change method to give back 10. After running the test it seems to do just that.

=end
#    - Test Give Receipt Method - Cash Register
=begin

Write a test for method CashRegister#give_receipt that ensures it displays a valid receipt.

=end
=begin

This will be something a bit new. This method outputs something to stdout. So, that is what you will want to test. Remember to keep the minitest docs close by, as they should prove useful for this exercise.

Solution
Copy Code
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

  # Other tests omitted for brevity

  def test_give_receipt
    item_cost = 35
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end
end
Discussion
For this test, we'll be testing that our method outputs a certain message. To test this, we need to use the assertion, assert_output. Outputting a message is also considered a side effect, so it is something we would want to test. This is especially true since our message should reflect a state of our current transaction. assert_output uses a slightly different syntax than something like assert and assert_equal. We pass in code that will produce the "actual" output via a block.
Then, internally assert_ouput compares that output to the expected value passed in as an argument. In this case that expected value is: "You've paid $#{item_cost}.\n"
Notice that we include a newline character at the end there. Any little nuances related to the implementation of our method have to be taken into account. puts appends a newline to the message that is output. We must include that newline character in our expected value as well when making an assertion with assert_output

=end
#    - Test Prompt for Payment Method - Transaction
=begin

Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly. We've changed the transaction class a bit to make testing this a bit easier. The Transaction#prompt_for_payment now reads as:

Copy Code
def prompt_for_payment(input: $stdin)
  loop do
    puts "You owe $#{item_cost}.\nHow much are you paying?"
    @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
    break if valid_payment? && sufficient_payment?
    puts 'That is not the correct amount. ' \
         'Please make sure to pay the full cost.'
  end
end
We've added an input keyword parameter that lets the caller provide a different source of input. The default value for the parameter is $stdin; if we don't provide the input parameter, Ruby will use $stdin as its value.

What is $stdin? It represents the standard input stream, which is usually the keyboard. Specifically, $stdin is a global variable that Ruby uses to represent the default source of input. Thus, when we write code such as str = gets.chomp, it's equivalent to str = $stdin.gets.chomp.

If we don't need to specify $stdin, then why do we need to use it this method? Couldn't we just call gets.chomp.to_f on line 4 above? We could, if we always wanted to get input from the keyboard. However, sometimes we need to get input from elsewhere. In particular, when testing interactive programs, you don't want to sit at the keyboard and provide the same inputs over and over. It would be nice if we could "mock" the keyboard input - that is, send input to the program in such a way that it can read it without changing any code. That's where code like this comes into play. We can call prompt_for_payment with an argument that provides the input in a way that is indistinguishable from keyboard input.

In this exercise, we'll need to simulate -- mock -- the user input. Our tests need to be automated, so we can't prompt the user with Kernel#gets. One way to do that is to pass a "string stream" to the method as the input parameter. Ruby provides a string stream class called StringIO. To use it, all you need to do is create a StringIO object that contains all of your simulated keyboard inputs, then pass it to prompt_for_payment. For instance:

Copy Code
input = StringIO.new("30\n")
transaction.prompt_for_payment(input: input)
The object assigned to input here is a StringIO object that simulates the keyboard by acting like the user type the number 30, then pressed the Return key (\n). Check out how this works with gets:

Copy Code
input = StringIO.new("30\n")
number = input.gets.chomp
puts "The number was #{number}!"   # prints "The number was 30!"
With this technique, running tests for keyboard entry is a breeze. Just sit back and watch things run. Writing the tests is a little harder. Once you understand how a StringIO object works, though, and you modify your code for the additional flexibility, it's not too hard.

The key to solving this exercises lies with this technique. We'll be testing a method defined in the Transaction class. It may be best to include this test in a new test file related to the Transaction class.

=end
=begin

require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    transaction.prompt_for_payment(input: input)
    assert_equal 30, transaction.amount_paid
  end
end
Discussion
With the description above, this code isn't too difficult to understand. The test first creates a new transaction for an item whose cost is $30. We then create a StringIO object that simulates a keyboard entry of the number 30 followed by a newline character. Next, we pass the StringIO object to the prompt_for_payment method.

Since prompt_for_payment will get its input from the StringIO object, it will act exactly like it would have were we using the keyboard directly. In this case, it will set the amount paid to $30 and return. Finally, we can assert that the right amount was paid.

=end
#    - Alter Prompt for Payment Method - Transaction
=begin

You may have noticed something when running the test for the previous exercise. And that is that our minitest output wasn't that clean. We have some residual output from the Transaction#prompt_for_payment method.

Copy Code
Run options: --seed 52842

# Running:

You owe $30.
How much are you paying?
.

Finished in 0.001783s, 560.7402 runs/s, 560.7402 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
Transaction#prompt_for_payment has a call to Kernel#puts and that output is showing up when we run our test. Your task for this exercise is to make it so that we have "clean" output when running this test. We want to see something like this:

Copy Code
Run options: --seed 4957

# Running:

.

Finished in 0.000919s, 1087.9984 runs/s, 1087.9984 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

=end
=begin

The key to this exercise lies once again in the StringIO class. Similar to the previous exercise, this will involve using another mock object, but for output this time. The cool thing about StringIO objects is that they can both provide input to Ruby and consume output; for this problem, you need to consume the output of the puts.

You may make changes to the Transaction#prompt_for_payment method to fulfill the requirements of this exercise. Note that you should not remove the calls to puts.

Solution
Copy Code
require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end
end
Copy Code
def prompt_for_payment(input: $stdin, output: $stdout)
  loop do
    output.puts "You owe $#{item_cost}.\nHow much are you paying?"
    @amount_paid = input.gets.chomp.to_f
    break if valid_payment? && sufficient_payment?
    output.puts 'That is not the correct amount. ' \
         'Please make sure to pay the full cost.'
  end
end
Discussion
For this exercise we'll have to work on two things. First, we'll create a mock object to use in test_prompt_for_payment. output = StringIO.new Unlike when we created a mock object for input we don't have to set the String for our mock. We'll end up calling StringIO#puts on output and that is what will set the String value for our StringIO mock object. Second, we have to alter the Transaction#prompt_for_payment method to accept a mock of our output. This will work in a similar way to how we mocked the input. We add a new parameter to Transaction#prompt_for_payment that will allow us to pass in an output mock object. def prompt_for_payment(input: $stdin, output: $stdout) Then, we use this output mock object within our method, we call StringIO#puts and the string passed to puts gets stored within the StringIO object. It isn't output to the user. Doing this should allow us to clean up our testing output that displays when running minitest.

Let's run the test again with our output mock:

Copy Code
Run options: --seed 45397

# Running:

.

Finished in 0.000912s, 1096.4154 runs/s, 1096.4154 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
There, now all we see is output related to the test itself.

=end
#    - Swap letters sample text and starter file
=begin
=end
#    - Test swap method - Text
=begin

This is not an actual exercise. It is the sample text and class for the next two exercises.

Sample Text
Copy Code
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
et varius mauris, at pharetra mi.
Class and method to Test
Copy Code
class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end
end


For this exercise you'll be given a sample text file and a starter class. The sample text's contents will be saved as a String to an instance variable in the starter class.

The Text class includes a #swap method that can be used to replace all occurrences of one letter in the text with another letter. And for this exercise we will swap all occurrences of 'a' with 'e'.

Your task is to write a test suite for class Text. In that test suite write a test for the Text method swap. For this exercise, you are required to use the minitest methods #setup and #teardown. The #setup method contains code that will be executed before each test; #teardown contains code that will be executed after each test.


To complete this exercise, you'll need to read the text from the sample text file. Some of those file related operations are good candidates for execution in setup and teardown. We want to put code in setup and teardown that may not be directly related to our tests, but is necessary for them to run properly.

Solution
Copy Code
require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    actual_text = text.swap('a', 'e')
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal expected_text, actual_text
  end

  def teardown
    @file.close
  end
end
Discussion
To write this test we'll need to first create an instance of class Text. Then, we need to pass it the text we want to work on. To do that we'll have to read that text from the sample text file. First, we must open the file for reading. We want to keep things directly related to our test in our test method. So, any code that is necessary to setup the test is a perfect candidate for the #setup method. We do so in our solution by opening the file in question and assigning the file object to an instance variable.

Once we have passed in the contents of that file to the Text class, we're ready to make the command that will lead to the assertion for this test. That command is the call to Text#swap. In this case, the exercise asks us to use a and e as the letters to swap out. The return value of this Text#swap method is what we will use to test that this method is working as intended.

Next, we need a String that we can test against the return value of Text#swap. This will be our expected value for the later assertion. To get this String, we just take the contents of the file and process it manually with our text editor to replace all of the as with es.

Finally, we use assert_equal to ensure that the expected value of the text is equal to the actual value.


=end
#    - Test word_count method - Text
=begin

Recall that in the last exercise we only had to test one method of our Text class. One of the useful facets of the setup and teardown methods is that they are automatically run before and after each test respectively. To show this we'll be adding one more method to our Text class, word_count.

Copy Code
class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end
Write a test for this new method. Make sure to utilize the setup and teardown methods for any file related operations.

=end
=begin

require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  # omitted for brevity

  def test_word_count
    text = Text.new(@file.read)
    assert_equal 72, text.word_count
  end

  def teardown
    @file.close
  end
end
Discussion
For this test we first need to determine the word count of the sample text. That can be ascertained easily enough by calling the word_count method manually, or by reading in the file in irb and counting the words from there. We then write in that value into our test as the expected value. We also need to make sure that we read the file to gain access to the relevant text. We're able to call @file.read since the opening of our file is handled in the setup method. If we didn't first open that file, then calling @file.read would throw an error. Lastly, we use assert_equal with our hard-coded word count and a call to text.word_count as arguments.

Regarding our teardown method, Ruby can be a bit lenient when it comes to closing files. If we didn't call @file.close, then the File object associated with @file would be closed when our script is finished running. This is a failsafe implemented by the IO class. But it is best to be explicit about these things. Since this is an example where we only work with one file, things may turn out ok. But imagine if we were dealing with several files, we would want to keep track of when they are opened and closed. It may not seem all that intuitive that our File really is closed properly. We could add one more line of code to our test file to verify that teardown is called after each test. We'll use the predicate method, closed? to verify that we have closed our file.

Copy Code
class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  # omitted for brevity

  def test_word_count
    text = Text.new(@file.read)
    assert_equal 72, text.word_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end
When we run our test, we should now see 2 lines of output(along with our test output), one line of output for each test we have run in this file.

=end
#- Advanced
#-----------------------------------------------------------------------------------------------------------------------------------
#    - Internal vs External Iterators
=begin

This exercise covers material that you do not have to master. We provide the exercise as a way to demonstrate how Enumerator objects work.

Thus far, we've used iterators often. You've seen the use of #each and #map used on various data structures, such as Arrays and Hashes. These methods make writing certain code a bit easier, at least when compared to a while or for loop. Yet, what we've seen thus far is only part of what is available.

Whenever we use map or each on something like an Array, we're using something called "Internal Iteration". It's called that because the process and implementation of that iteration is hidden from us, and the process that allows us to progress through a collection is part of that hidden implementation.

There's also "External Iteration". This is iteration that takes place at the behest of the user. Ruby gives us the option to use this type of iteration with the Enumerator class. For this exercise, lets take a bit of a tour of the capabilities of Enumerator. While we do that, let's make something interesting with it.

In this exercise, your task is to create a new Enumerator object. When creating a new Enumerator, you may define what values are iterated upon. We'll want to create an Enumerator that can iterate over an infinite list of factorials. Once you make this new Enumerator, test it out by printing out the first 7 factorial values, starting with zero factorial.

More specifically, print the first 7 factorials by using an "External Iterator". Once you have done so, see what happens if you print 3 more factorials (the results won't be correct). Now, reset your Enumerator (use the rewind method). Finally, print 7 more factorials.

You can find almost everything you need for this exercise in the documentation for Enumerator. In particular, check out the ::new method; it should prove a good starting point for this exercise. Some further details about internal vs external iterators are mentioned at the start of that documentation, so make sure to read that section. That section is a bit dense at places; if you don't understand everything about it, that's ok.

A factorial is a mathematical operation that involves multiplying a bunch of sequential positive numbers together. They are usually written as a non-negative integer followed by an exclamation point, e.g., 4!. The values look like this:

n	n!	notes
0	1	By definition, 0! is 1
1	1	By definition, 1! is 1
2	2	2! = 2 * 1
3	6	3! = 3 * 2 * 1
4	24	4! = 4 * 3 * 2 * 1
5	120	5! = 5 * 4 * 3 * 2 * 1
The factorial values (0!, 1!, 2!, etc.) follow a simple pattern. First, 0! and 1! are both defined to be 1. All subsequent factorials are the result of multiplying all the integers from 1 up to the n value together. Thus, 5! is 5 * 4 * 3 * 2 * 1, or 120.

The wikipedia page on factorials may also be of some use.

Two final hints:

You'll only need 3 Enumerator methods to complete this exercise.
An Enumerator also implements the Enumerable module. Keep this in mind, as it may make certain parts of this exercise easier to write.

=end
=begin

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

# External iterators

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

# Internal iterators

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end
Output:

Copy Code
0! == 1         # Output of first times loop
1! == 1
2! == 2
3! == 6
4! == 24
5! == 120
==========================
0! == 720       # Output of 2nd times loop: note the incorrect output
1! == 5040
2! == 40320
3! == 362880
4! == 3628800
5! == 39916800
==========================
0! == 1         # Output of 3rd times loop: this time output is correct
1! == 1
2! == 2
3! == 6
4! == 24
5! == 120
==========================
0! == 1         # Output of each_with_index
1! == 1
2! == 2
3! == 6
4! == 24
5! == 120
Discussion
Most of the work for solving this problem relates to creating our new Enumerator object. We can get a good start at understanding how to do this by referencing the Enumerator::new method. It shows how to define a new Enumerator that iterates over Fibonacci numbers. We'll start with that as a template, and alter it to iterate over factorials instead. For iterating over factorials, we'll need two variables: one to track which number factorial we are on, and another store the cumulative value of all prior factorials. We use accumulator for the latter, and we use number for the former.

When defining an external iterator, we set the next value in the iteration by calling yielder << value. In this case, we use accumulator for value; it sets the current factorial value.

To use our Enumerator object as an internal and external iterator, we utilize two different groups of code. First, we have 3 calls to the Intger#times method; this code uses an external iterator (factorial.next). Lastly, we have an #each_with_index loop; this code uses an internal iterator.

There is some curious behavior with the external iterators -- the Enumerator doesn't know when to quit. On the first call to #times, everything works as expected. However, in the second, things seem to have gotten out of hand. The call to #times is not printing the desired values.

The problem here is that the Enumerator doesn't know when we're done iterating when we using an external iterator. That's something internal iterators do. However, with external iterators, we need to explicitly tell the Enumerator when we're done. We do that by calling the Enumerator#rewind method, which we do on line 15. Note that #rewind doesn't tell the Enumerator when to stop iterating; it really tells the Enumerator that it's time to begin a new iteration.

Once we call #rewind, the 3rd invocation of times again produces the correct results.

Next, we move on to our #each_with_index call. #each_with_index is designed to work with Enumerator objects, so it uses an internal iterator. In particular, #each_with_index knows that it needs to call #rewind each time you invoke it. Therefore, when we invoke #each_with_index here, it automatically calls #rewind, and outputs the desired results.

Note that we need to explicitly break out of this loop; the factorial method doesn't have a natural stopping point, but will keep going for as long as you let it.

=end
#    - Exploring Procs, Lambdas, and Blocks: Definition and Arity
=begin

This exercise covers material that you do not have to master. We provide the exercise as a way to explore the differences between procs, lambdas, and blocks.

For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and implicit blocks. Two groups of code also deal with the definition of a Proc and a Lambda, and the differences between the two. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

Copy Code
# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=end
=begin

Solution
Group 1:

A new Proc object can be created with a call of proc instead of Proc.new
A Proc is an object of class Proc
A Proc object does not require that the correct number of arguments are passed to it. If nothing is passed, then nil is assigned to the block variable.
Group 2

A new Lambda object can be created with a call to lambda or ->. We cannot create a new Lambda object with Lambda.new
A Lambda is actually a different variety of Proc.
While a Lambda is a Proc, it maintains a separate identity from a plain Proc. This can be seen when displaying a Lambda: the string displayed contains an extra "(lambda)" that is not present for regular Procs.
A lambda enforces the number of arguments. If the expected number of arguments are not passed to it, then an error is thrown.
Group 3

A block passed to a method does not require the correct number of arguments. If a block variable is defined, and no value is passed to it, then nil will be assigned to that block variable.
If we have a yield and no block is passed, then an error is thrown.
Group 4

If we pass too few arguments to a block, then the remaining ones are assigned a nil value.
Blocks will throw an error if a variable is referenced that doesn't exist in the block's scope.
Comparison

Lambdas are types of Proc's. Technically they are both Proc objects. An implicit block is a grouping of code, a type of closure, it is not an Object.
Lambdas enforce the number of arguments passed to them. Implicit blocks and Procs do not enforce the number of arguments passed in.

=end



### Challenges

