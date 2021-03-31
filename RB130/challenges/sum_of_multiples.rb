## First Solution; passes all test cases but you might need to restructure it a bit so that the 3/5 thing works more generally 


# class SumOfMultiples
#   attr_reader :numbers

#   def initialize(*numbers)
#     @numbers = *numbers
#   end

#   def to(stop)
#     multiples = []
#     (1..stop).each do |num|
#       counter = 0
#       loop do 
#         break if counter == numbers.size
#         multiples << num if (num % numbers[counter] == 0)
#         counter += 1
#       end
#     end
#     multiples = (multiples.uniq - [stop]).inject(&:+)
#   end

#   def self.to(stop)
#     multiples = []
#     (1..stop).each do |num|
#       multiples << num if (num % 3 == 0) || (num % 5 == 0)
#     end
#     multiples = (multiples.uniq - [stop])
#      if multiples.empty?
#        0
#      else
#       multiples.inject(&:+)
#      end
#   end

# end


## Second Time Solution



class SumOfMultiples
  
  def initialize(*numbers)
    @numbers = []
    if numbers.size > 0
      @numbers = numbers
    else
      @numbers = [3, 5]
    end
  end

  def to(num)
    results = []
    @numbers.each do |ele|
      return 0 if @numbers.first > num
      (ele...num).each do |i|
        results << i if i % ele == 0
      end
    end
    results.uniq.inject(&:+)
  end

  def self.to(num)
     SumOfMultiples.new.to(num)
  end
end
