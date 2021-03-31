## First Time Solution

# class PerfectNumber
#   def self.classify(num)
#     raise StandardError if num <  0
#     divisors = []
#     (1...num).each do |x|
#       divisors << x if num % x == 0
#     end
#     sum = divisors.inject(&:+)
#     if sum == num
#       "perfect"
#     elsif sum > num
#       "abundant"
#     else
#       "deficient"
#     end
#   end
# end


class PerfectNumber
  attr_reader :num

  def initialize
    raise StandardError if num < 1
  end

  def self.classify(num)
    @num = num
    divisors = []
    (1..num).each do |ele|
      divisors << ele if num % ele == 0 && num != ele
    end
    if divisors.inject(&:+) == num
      "perfect"
    elsif divisors.inject(&:+) < num
      "deficient"
    else
      "abundant"
    end
  end
end





