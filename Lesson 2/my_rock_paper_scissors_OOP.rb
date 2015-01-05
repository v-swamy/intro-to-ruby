CHOICES = ['Rock', 'Paper', 'Scissors']

class Player
  attr_accessor :choice, :name

  def get_choice
    puts "Please choose (R)ock, (P)aper, or (S)cissors."
    choice_string = gets.chomp.downcase
    until ['r', 'p', 's'].include?(choice_string)
      puts "Not a valid choice. Please choose (R)ock, (P)aper, or (S)cissors."
      choice_string = gets.chomp.downcase
    end
    if choice_string == 'r'
      @choice = CHOICES[0]
    elsif choice_string == 'p'
      @choice = CHOICES[1]
    elsif choice_string == 's'
      @choice = CHOICES[2]
    end
  end

  def get_name
    puts "Please enter your name."
    self.name = gets.chomp
  end
end

class Computer
  attr_reader :choice
  def initialize
    @choice = CHOICES.sample
  end
end

class RockPaperScissors
  attr_accessor :continue

  def initialize
    @continue = true
  end

  def print_choices(player, computer)
    puts "You chose #{player.choice} and computer chose #{computer.choice}."
  end

  def give_result(player, computer)
    result_array = [player.choice, computer.choice]
    if player.choice == computer.choice
      puts "-- It's a tie! --"
    elsif result_array.include?("Rock") && result_array.include?("Paper")
      puts "-- Paper wraps Rock! --"
    elsif result_array.include?("Rock") && result_array.include?("Scissors")
      puts "-- Rock smashes Scissors! --"
    elsif result_array.include?("Paper") && result_array.include?("Scissors")
      puts "-- Scissors cuts Paper! --"
    end
  end

  def declare_winner(player, computer)
    case 
    when player.choice == "Rock"
      if computer.choice == "Paper"
        puts "** #{player.name} loses! **"
      elsif computer.choice == "Scissors"
        puts "** #{player.name} wins! **"
      end
    when player.choice == "Paper"
      if computer.choice == "Rock"
        puts "** #{player.name} wins! **"
      elsif computer.choice == "Scissors"
        puts "** #{player.name} loses! **"
      end
    when player.choice == "Scissors"
      if computer.choice == "Rock"
        puts "** #{player.name} loses! **"
      elsif computer.choice == "Paper"
        puts "** #{player.name} wins! **"
      end
    end
  end

  def ask_to_continue
    puts "Would you like to continue? (Y/N)"
    choice = gets.chomp.downcase
    if choice != 'y'
      system 'clear'
      puts "Thanks for playing!"
      self.continue = false
    else 
      system 'clear'
    end
  end

  def set_up_game(player)
    system 'clear'
    puts "---- Welcome to Rock/Paper/Scissors! ----"
    puts ""
    player.get_name
  end

  def run
    player = Player.new
    set_up_game(player)
    while self.continue
      computer = Computer.new
      player.get_choice
      self.print_choices(player, computer)
      self.give_result(player, computer)
      self.declare_winner(player, computer)
      self.ask_to_continue
    end
  end
end

game = RockPaperScissors.new
game.run





      
    






