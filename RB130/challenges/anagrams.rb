# Input: String
# Output: array, containing strings

## First Time solution

# class Anagram
#   attr_reader :string, :test_arr

#   def initialize(string)
#     @string = string
#     @test_arr = string.downcase.chars.sort
#   end

#   def match(array)
#     results = []
#     array.each do |word|
#       results << word if word.downcase.chars.sort == test_arr && word.downcase != string.downcase
#     end
#     results.sort
#   end 
# end


## Second Time solution 

class Anagram
  def initialize(word)
    @word = word
  end

  def match(array)
    result = []
    array.each do |element|
      next if element.downcase == @word.downcase
      result << element if element.chars.map(&:downcase).sort == @word.chars.map(&:downcase).sort
    end
    result
  end
end

