### First time solution


# Point_1 = %w(A E I O U L N R S T)
# Point_2 = %w(D G)
# Point_3 = %w(B C M P)
# Point_4 = %w(F H V W Y)
# Point_5 = %w(K)
# Point_8 = %w(J X)
# Point_10 = %w(Q Z)

# class Scrabble
#   attr_reader :string

#   def initialize(string)
#     @string = string
    
#   end

#   def score
#     score = 0
#     if string == nil
#       return 0
#     else
#       string.chars.each do |letter|
#         if Point_1.include?(letter.upcase) 
#           score += 1
#         elsif Point_2.include?(letter.upcase)
#           score += 2
#         elsif Point_3.include?(letter.upcase) 
#           score += 3
#         elsif Point_4.include?(letter.upcase)  
#           score += 4
#         elsif Point_5.include?(letter.upcase)  
#           score += 5
#         elsif Point_8.include?(letter.upcase)  
#           score += 8
#         elsif Point_10.include?(letter.upcase)  
#           score += 10
#         end
#       end
#       score
#     end
#   end

#   def self.score(string)
#     score = 0
#     string.chars.each do |letter|
#       if Point_1.include?(letter.upcase) 
#         score += 1
#       elsif Point_2.include?(letter.upcase)
#         score += 2
#       elsif Point_3.include?(letter.upcase) 
#         score += 3
#       elsif Point_4.include?(letter.upcase)  
#         score += 4
#       elsif Point_5.include?(letter.upcase)  
#         score += 5
#       elsif Point_8.include?(letter.upcase)  
#         score += 8
#       elsif Point_10.include?(letter.upcase)  
#         score += 10
#       end
#     end
#     score
#   end
# end


## Second time solution

CONVERSIONS = {
  "AEIOULNRST" => 1,
  "DG" => 2,
  "BCMP" => 3,
  "FHVWY" => 4,
  "K" => 5,
  "JX" => 8,
  "QZ" => 10
}

class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word
    
  end

  def score
    if @word == nil
      return 0
    else
      score = 0
      @word.upcase.chars.each do |letter|
        CONVERSIONS.each do |key, value|
          score += CONVERSIONS[key] if key.include?(letter)
        end
      end
      score
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
