require "pry"

david schwarn 1 hour video ~  15 years ago
australia building blocks

#added a change

class GuessingGame
  attr_reader :rando
  attr_accessor :guess, :option, :menu_option, :hint

  def initialize
    @rando = rand(1..100)
    @hint = ""
    @guess = nil
    @option = "y"
    @menu_option = nil
  end

  def play_game
    while option == "y"
      puts rando
      generate_hint
      welcome
      while guess != rando
        compare
        call_menu
        get_option
        exe_option
      end
      farewell
    end
  end

  def welcome
    puts ""
    puts "Welcome to the Guessian Game"
    puts "I have generated a random number between 1 and 100 for you to guess."
    puts "What is your guess?"
    @guess = gets.to_i
  end

  def farewell
    puts "You guessed it!"
  end


  def compare
    if guess > rando
      puts "The secret number is lower."
    elsif guess < rando
      puts "The secret number is higher."
    end
    puts "Guess again. What is your new guess?"
    @guess = gets.to_i
  end

  def call_menu
    puts "Type 1 to get a hint."
    puts "Type 2 to see the secret number."
    puts "Type 3 to exit the program."
  end

  def get_option
    @menu_option = gets.to_i
    puts "Your option is #{menu_option}"
  end

  def exe_option
    if menu_option == 1
      puts hint
    end
    if menu_option == 2
      puts rando
    end
    if menu_option == 3
      option = "n"
    end
  end

  def generate_hint
    i = 2
  #Run through loop to determine what the hint should be.
  #note: ignores 1, and determining the number itself.
    while i <= rando - 1
      if (rando % i) == 0
        @hint = "The random number is divisible by #{i}."
      end
      i += 1
    end
  #case in which the random number was divisible by 1 and itself, or 2.
    if hint.empty? == true
      @hint = "The random number may be prime"
    end
  #case in which the random number is 42.
    if rando == 42
      @hint = "The answer to the Ultimate Question of Life, the Universe, and Everything"
    end
  end
end

game = GuessingGame.new()
game.play_game
