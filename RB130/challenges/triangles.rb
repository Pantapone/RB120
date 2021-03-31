
# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.


## return argument error if side given is not above 0

## First Time Solution


# class Triangle
#   attr_reader :side1, :side2, :side3

#   def initialize(side1, side2, side3)
#     @side1 = side1
#     @side2 = side2
#     @side3 = side3
#     raise ArgumentError.new "Wrong lengths" unless no_error
#   end

#   def kind
#     if side1 == side2 && side2 == side3
#       "equilateral"
#     elsif (side1 != side2) && (side2 != side3) && (side1 != side3)
#       "scalene"
#     elsif (side1 == side2 && side2 != side3) || (side1 == side3 && side1 != side2) || (side2 == side3 && side1 != side2)
#       "isosceles"
#     end
#   end

#   def no_error
#     side1 > 0 &&
#     side2 > 0 &&
#     side3 > 0 &&
#     side1 + side2 >= side3 &&
#     side1 + side3 >= side2 &&
#     side2 + side3 >= side1
#   end

# end


#definition triangle: length > 0; any two sides must be gerater or equal to the length of the third side


class Triangle
  attr_reader :a, :b, :c 

  def initialize(a, b, c)
    @a = a 
    @b = b 
    @c = c
    raise ArgumentError unless true_triangle
  end

  def true_triangle
    return true if a && b && c > 0 &&
      a + b > c &&
      a + c > b &&
      b + c > a 
  end

  def kind
    if (a == b) && (b == c)
      "equilateral"
    elsif (a != b) && (b != c) && (a != c)
      "scalene"
    else
      "isosceles"
    end   
  end
end