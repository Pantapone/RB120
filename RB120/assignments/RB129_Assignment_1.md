**Method Access Control** 

There are three method access control key words:  `public`, `private` and `protected`. With these we can control the visibility of methods in Ruby, and protect out data against unwanted modifications.

They can only be used on methods. In Ruby, methods are by default public, unless one of the other key words is used. Contrast this with Ruby instance variables which are private and can only be accessed via methods, which is why Ruby let's us create setter and getter methods easy via the `attr_reader`, `attr_writer` and `attr_accessor` methods.

(1) Methods that are **public** can be accessed from inside a class as well as from the outside of a class. 

For example: 

```ruby
class Pet
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def public_method
    puts "#{self.name} likes the public method!"
  end
end 

timmy = Pet.new("Timmy")
timmy.public_method       # => "Timmy likes the public method!"
```

We instantiate a new object of the `Pet` class by calling the `Class#new` method and passing it the string `"Timmy"` and assign it to the local variable `timmy`. We then can call the `public_method` instance method on our object `timmy` which will return the string `"Timmy likes the public method!"`.  

However, it is better practice to have as few public methods as possible. The reason for this is that public methods enable direct interfacing with the state of the object from outside of the class. This can result in unintended changes which can change the functionality of the program. Thus, to reduce the number of possible ways that we can change the state of our object will decrease the chance of those changes happening. Consider the following change to our example:

```ruby
class Pet
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def public_method
    "#{self.name} likes the public method!"
  end
end 

timmy = Pet.new("Timmy")
timmy.public_method       # => "Timmy likes the public method!"
timmy.name                # => "Timmy"
puts timmy.name.upcase!   # => "TIMMY"
timmy.public_method       # => "TIMMY liekes the public method!"

```

Within our `Pet` class, we defined a getter method through the `attr_reader` method, which allows theoretically only access to the `@name` instance variable outside of the `timmy` object, once it's instantiated. Nevertheless, when we call the `String#upcase!` method, we are able to mutate the string object `"Timmy"` that was assigned to `@name`, even though we did not define a setter method to change the value of the `@name` instance variable. Therefore, it is better to avoid using public methods when possible.



Both *private* and *protected* methods can be only accessed from within the class itself or by sub- or superclasses but not from outside of the class definition. 

(2) So **private** method calls prevents that instance methods are accessed from outside of the class where they are defined, thus allowing encapsulation, i.e. they prevent unnecessary access or changes to the state of objects. As private methods can be accessed from within the definition of a class, public methods can access their return values. For example: 

```ruby
class Pet
  def public_method
    private_method
  end

  private
  def private_method
    puts "I'm private!"
  end
end 

timmy = Pet.new
timmy.public_method       # => "I'm private""
timmy.private_method      # => NoMethodError (private method `private_method` called for #<Pet:0x00007fa0d18fa330>)
```

In our example above, calling `private_method` on our `timmy` object results in a `NoMethodError` as private methods cannot be be accessed outside of the class definition. In contrast, we can call `public_method`, which is able to access `private_method` as it is part of the class definition and thus is able to output `"I'm private!"` and return `nil`, via the `private_method`. 



(3) Finally, protected method calls are useful if we want our objects to be able to interact with other instances of the same class and subclasses, but otherwise prevent direct access or changes to the object's state from outside of the class definition. In this sense, it can be seen as a middle-ground between public and private methods. For example: 

```ruby
class Pet
  def initialize(name)
    @name = name
  end
  def run(other)
    "#{@name} runs with #{other.name}"
  end

  protected

  def name 
    @name
  end
end

class Dog < Pet
end

timmy = Pet.new("Timmy")
raph = Dog.new("Raph")

timmy.run(raph)       # => "Timmy runs with Raph" 
timmy.name            # => "NoMethodError (protected method `name' called for #<Pet:0x00007fe1f3155d10 @name="Timmy">)


```

In the example above, we are unable to call the protected `name` instance method on the `Timmy` object instantiated from the `Pet` class, as it is inaccessible outside of the class definition. However, we are able to access the `name` instance method of other instances of the `Pet` class in our `run` instance method. We would not have access to it, if we had used the `private` keyword instead of the `protected` keyword. They therefore are acting in the same manner as public methods from within class definitions, and in the same manner as private methods from outside a class definition.