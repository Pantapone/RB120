### Do again from the beginning

# contains unique values; any order; contains only numbers

class CustomSet
  attr_accessor :array

  def initialize(array =[])
    @array = array.uniq 
  end

  def empty?
    array == []
  end

  def contains?(num)
    array.include?(num)
  end

  def subset?
    
  end

  def disjoint?

  end

  def eql?(second_set)
    self.array.uniq.sort == second_set.array.uniq.sort 
  end

  def add(num)
    array.push(num) unless contains?(num)
    self
  end

  def intersection(second_set)
    
  end

  def difference(second_set)
    difference = self.array - second_set.array
    CustomSet.new(difference)
  end

  def union()

  end


end
# p CustomSet.new([3, 2, 1]).difference(CustomSet.new([2, 4]))
# expected = CustomSet.new([3, 1])