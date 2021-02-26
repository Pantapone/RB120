module Abilities
  class Cat
    def speak
      puts "hello"
    end

  end

  class Dog
  end

end

buddy = Abilities::Cat.new
buddy.speak

