# I stands for 1
# V stands for 5
# X stands for 10
# L stands for 50
# C stands for 100
# D stands for 500
# M stands for 1,000
# We don't have to worry about numbers higher than 3,000.
# Modern Roman numerals are written by expressing each digit of the number separately, starting with the left most digit and skipping any digit with a value of zero

# Input: Integer
# Output: String

# TRANSLATION = {
#   "M" => 1000,
#   "CM" => 900,
#   "D" => 500,
#   "CD" => 400,
#   "C" => 100,
#   "XC" => 90,
#   "L" => 50,
#   "XL" => 40,
#   "X" => 10,
#   "IX" => 9,
#   "V" => 5,
#   "IV" => 4,
#   "I" => 1
# }

# class RomanNumeral
#   attr_accessor :num

#   def initialize(num)
#     @num = num
#   end

#   def to_roman
#     roman = ""
#     input = num

#     TRANSLATION.each do |key, value|
#       multiplier, remainder = input.divmod(value)
#       if multiplier > 0
#         roman += (key * multiplier)
#       end 
#       input = remainder
#     end
#     roman
#   end
# end


TRANSLATION = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

class RomanNumeral
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def to_roman
    roman = ""
    input = num
    TRANSLATION.each do |key, value|
      x, y = input.divmod(value)
      if x > 0
        roman << (key * x)
      end
      input = y
    end
    roman
  end



end