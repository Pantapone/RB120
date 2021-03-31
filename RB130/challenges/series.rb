class Series
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def slices(num)
    raise ArgumentError.new if num > number.size
    number.chars.map(&:to_i).each_cons(num).to_a
  end
end
