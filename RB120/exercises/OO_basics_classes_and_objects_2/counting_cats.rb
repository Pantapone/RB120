class Cat
  @@number = 0

  def initialize
    @@number += 1
  end

  def self.total
    puts @@number
  end
end





kitty1 = Cat.new
kitty2 = Cat.new

Cat.total