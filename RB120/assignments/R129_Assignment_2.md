Note: All lines of code mentioned in the discussion below refer to the following: https://github.com/Pantapone/RB120/blob/main/RB120/explanation.rb

**Keeping score**

This additional feature was implemented to let the players play up to a certain number of points, e.g. `10` before the winner is determined. The basic logic I decided to use, was to keep track of the scores of the two players and check whether one of their scores fulfilled the defined winning condition, which would end the game and display the winner. In the following, I will focus on the implementation of keeping track of the score state of each player and how that demonstrates various OOP principles.

For the discussed example, the following classes and inheritance relationships in the code are of relevance. 

```ruby
class Player; end

# Subclasses of players are either a human or a computer
class Human < Player; end

class Computer < Player; end

# The different computer personalities 
class Bender < Computer; end
class R2D2 < Computer; end
class T800 < Computer; end
class OptimusPrime < Computer; end
class Sonny < Computer; end

# The move class and all it's subclasses (Scissors, Spock, Lizard, Paper, Rock) - not relevant for the discussed example

# Game Orchestration
class RPSGame; end

```

(1) The final winning condition is implemented by initialising a constant `WINNING_SCORE` to the integer object `10` within our class `RPSGame` on line 186. 

(2) As both players need to keep track of their score, an instance variable `@score` is initialized to the integer object `0` within the class `Player` on line 6 and a getter and setter method is created for it by using the `attr_accessor` method on line 2. Instantiating `@score` within the class `Player` demonstrates the concept of inheritance in Ruby. It allows classes to inherit behaviours (i.e. instance methods) from other classes. As can be seen in short overview of the relevant classes above: 

- The class `Human` (the subclass) inherits from the class `Player` (the superclass)
- The class `Computer` (the subclass) inherits from the class `Player` (the superclass). The different computer personalities classes `Bender`, `R2D2`, `T800`, `OptimusPrime`, and `Sonny`, each inherit from the `Computer` class, which means that they also inherit from its superclass, the `Player` class.

Using ***inheritance*** here, allows us to model logical hierarchies between the different classes (i.e. the different computer personalities are all types of computers, which are all types of players in our game). Thereby, we can reduce the amount of code we write as multiple objects have the same functionality. Inheritance is useful when we want various classes to share the same behaviours (i.e. instance methods), since these can be defined in the superclass and inherited by the subclass without having to rewrite code. That is, all of our players need to keep track of their score and thus, the instance variable `@score` is initiated within the superclass `Player`, and that's where the instance getter and setter methods are created, and not within one of the subclasses. In Ruby, classes can only inherit from a single class. It is a "is-a" relationship. `Bender` is a `Computer`, which in turn is a `Player`, but `Bender` could not inherit at the same time from the `Human` class as well. Inheritance would give us the flexibility to override methods if we do want our objects to respond to the same method name, but have a slightly different implementation.

The ***method lookup path*** is the chain of subclasses and superclasses that Ruby will look through to call methods. It is applicable when an object instantiated from a subclass calls a method that is inherited from a superclass (or mixed in through a module), and not explicitly defined within the subclass itself. When looking for an instance method along the method lookup path, Ruby will look in the immediate class from which an object was instantiated from, then any modules mixed in, starting from last to first module mixed into the class. If Ruby cannot find the associated method in the class or mixed in modules, it will look in the superclass, and any modules mixed into that superclass using the same process, and continue further up the inherited superclasses until it finds a relevant instance method (at which point it will stop looking), or return a `NoMethodError` exception. We can observe this sequence by calling the `Class#ancestors` method on a particular class. For example, if we would call `Bender.new.score`, Ruby will first look in the `Bender` class to see if there is a `score` instance method. Since this does not exist, it will then look in the `Computer` class and then in the `Player` class, where it will find the `score` method definition, at which point it will stop looking further up the method lookup chain, and call the `score` method. We could also verify the full method lookup path by calling the `Class#ancestors` method on the `Bender` class, which would return an array, displaying the method lookup path: `[Bender, Computer, Player, Object, Kernel, BasicObject]`.

Back to the game: Let's look at the game orchestration part of our code as implemented within our class `RPSGame`. For the sake of clarity, I omitted all parts of the code except the methods that are not directly relevant for my following explanations: 

```ruby
class RPSGame
  WINNING_SCORE = 10
  attr_accessor :human, :computer

  def initialize
    @computer = computer_sampler
    @human = Human.new
  end
  
  def computer_sampler
    [Bender.new, T800.new, OptimusPrime.new, Sonny.new, R2D2.new].sample
  end
end
```

Within our game, we instantiate two new players: a human and one of the five computer types. 

For the game orchestration, we need two players - a human and one of the five computer types, which are initialised within the `RPSGame` class. On line 195, we create a new object of our class `Human` and assigned it to the instance variable `@human`. *(Similarly, we create a new object of one of the computer subclasses (`Bender`, `R2D2`, `T800`, `OptimusPrime`, or `Sonny`), and assigned it to the instance variable `@computer`, by calling the method `computer_sampler` that we defined from line 365 to 367. Within it, the `sample` method is called on an Array containing each objects of the five subclasses of computers, thereby randomly assigning us one.)* Instance variables can however hold any object, even an object of a custom class we have created. This demonstrates the concept of ***collaborator objects*** in Ruby. Collaborator objects are objects that are assigned to instance variables when objects are instantiated from a class and the  `initialize` method is called. Functionally, they could be any object, whether they are custom objects we define, or objects pre-defined by the Core API in Ruby (e.g. objects instantiated from the Integer, String, Array classes). Collaborator objects allow us to model associative relationships ("has-a") between objects and define how those objects should interact with other objects. The collaborative relationship exists when the collaborator object is added to the state of the object (through assigning it as a value to an instance variable). In the code above, we instantiate an object from the `Human` class with the `Class#new` method, the `initialize` method is called and the object is assigned to the instance variable `@human`. Thus, we have a collaborative relationship specified between our game orchestration class `RPSGame` and the `Human` class through the instance variable `@human`. Our object assigned to `@human` has access to the methods of the class `Human` and it's superclass `Player`, which we can therefore call from within the `RPSGame` class. Via the `attr_accessor` on line 187, setter and getter methods for the instance variables `@human` and `@computer` are created. 

This also demonstrates ***encapsulation***, i.e. the hiding of functionality within code:  we instantiate objects from classes. Within those objects, we have instance variables (created on instantiation of objects when assigned a value) and instance methods (defined in the class) that are encapsulated within the object, and can only be accessed by that object's class or the object itself. This improves our ability to debug when we make changes to code and reduce the number of dependencies on/from other parts of the code base by encapsulating methods that are relevant to a class as a logical entity (i.e. instead of calling methods from various classes or modules, which would introduce additional dependencies).  While encapsulation reduces the interactivity of different parts of the program in order to protect unnecessary changes to object state. For example, any changes we make to `Human`  (or objects instantiated from `Human` ) is made specifically to that class, meaning any errors we get in relation `Human` or objects instantiated from `Human` can likely be resolved in a single location in our code.

Thus, from within our class `RPSGame` we can access the `score` instance setter method within the `Player` class through the object instantiated from the `Human` class, which inherits the method from the `Player` class. For example, in the following code, we call the `score` setter method with the object from the `Human` class that we saved in the instance variable `@human`, and save the incremented score state within this calling object. As `human` is an object of the class `Human`, it as access to its methods. Thus, it will look first in the subclass `Human` for methods. It does not find the `score` method, within the subclass `Human`, thus it looks further up in the inheritance hierarchy to the super class, which is in this example `Player`, where it does find the instance method `score`. 

```ruby
 	def score_incrementer
    if human_win?
      human.score += 1
    elsif computer_win?
      computer.score += 1
    end
  end
```

To evaluate whether our winning condition (1) is met, we can access get the value that the instance variable `@score` is assigned to, by calling the instance setter method for our instantiated object on it, i.e. `human.score`, which then accesses the score and can therefore evaluate whether either of the two comparisons evaluate to `true`, which would then be the return value of calling the `game_winner?` method. 

```ruby
def game_winner?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end
```









