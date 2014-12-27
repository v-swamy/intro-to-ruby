
puts "Play Rock/Paper/Scissors!"

begin
  choices = {"r" => "Rock", "p" => "Paper", "s" => "Scissors"}

  puts "Choose one: (R/P/S)"
  user_choice = gets.chomp
  user_choice = user_choice.downcase

  computer_choice = choices.keys.sample

  puts "You picked #{choices[user_choice]} and computer picked #{choices[computer_choice]}."

  
  def result(user, computer)
    result_array = [user, computer]
    if user == computer
      puts "It's a tie!"
    elsif result_array.include?("r") && result_array.include?("p")
      puts "Paper wraps Rock!"
    elsif result_array.include?("r") && result_array.include?("s")
      puts "Rock smashes Scissors!"
    elsif result_array.include?("p") && result_array.include?("s")
      puts "Scissors cuts Paper!"
    end
  end

  case 
  when user_choice == computer_choice
    result(user_choice, computer_choice)
  when user_choice == "r"
    if computer_choice == "p"
      result(user_choice, computer_choice)
      puts "You lose!"
    elsif computer_choice == "s"
      result(user_choice, computer_choice)
      puts "You win!"
    end
  when user_choice == "p"
    if computer_choice == "r"
      result(user_choice, computer_choice)
      puts "You win!"
    elsif computer_choice == "s"
      result(user_choice, computer_choice)
      puts "You lose!"
    end
  when user_choice == "s"
    if computer_choice == "r"
      result(user_choice, computer_choice)
      puts "You lose!"
    elsif computer_choice == "p"
      result(user_choice, computer_choice)
      puts "You win!"
    end
  end
  
  puts "Play again? (Y/N)"
  answer = gets.chomp
end while answer.downcase == 'y'






