class Player
  attr_accessor :move, :name

  def initialize(type = :human)
    @player_type = type
    @move = nil 
    set_name
  end

  def choose
    if human?
      choice = nil 
      loop do 
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp 
        break if ["rock", "paper", "scissors"].include?(choice)
        puts "Sorry, invalid choice."
      end
        self.move = choice
    else
      self.move = ["rock", "paper", "scissors"].sample
    end
  end

  def human?
    @player_type == :human
  end

end
  class Human < Player
    def set_name
        n = ""
        loop do
          puts "What's your name?"
          n = gets.chomp
          break unless n.empty?
          puts "Sorry you must enter a value"
        end
        self.name = n
    end
  end

  class Computer < Player
    def set_name
      self.name = ["Player A", "Player B", "Player C"].sample
    end
  end



class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to the game"
  end

  def display_goodbye_message
    puts "Thanks for playing. Good bye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    case human.move
    when "rock"
      puts "It's a tie" if computer.move == "rock"
      puts "#{human.name} won!" if computer.move == "scissors"
      puts "#{computer.name} won!" if computer.move == "paper"
    when "paper"
      puts "It's a tie" if computer.move == "paper"
      puts "#{human.name} won!" if computer.move == "rock"
      puts "#{computer.name} won!" if computer.move == "scissors"
    when "scissors"
      puts "It's a tie" if computer.move == "scissors"
      puts "#{human.name} won!" if computer.move == "paper"
      puts "#{computer.name} won!" if computer.move == "rock"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ["y", "n"].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end
    return true if answer == "y"
    return false
  end



  def play 
    display_welcome_message

    loop do 
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end


RPSGame.new.play

