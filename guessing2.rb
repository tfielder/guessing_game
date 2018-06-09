require "pry"

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
end

game = GuessingGame.new()
game.play_game
