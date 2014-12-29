# Display empty board

# Loop until winner or full board
# # Ask for user input for empty square (X)
# check for winner or full board
# # Computer will pick an empty square (O)
# check for winner or full board

# 4.)  Alternate between computer and user until board is full
# 5.)  Or until 3 in a row

# if there is a winner, show winner, 
# else it is a tie

#initialize the board
require 'pry'



#draw the board
def draw_board(b)
  system 'clear'
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "---+---+---"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "---+---+---"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

#find empty spaces
def empty_spaces(b)
  b.select { |k,v| v == ' '}
end

#user selects a space
def user_select_space(b)
  puts "Select a space (1 - 9)"
  user_selection = gets.chomp.to_i
  while !empty_spaces(b).keys.include?(user_selection)
    puts "That space is taken! Please select another space (1 - 9)"
    user_selection = gets.chomp.to_i
  end
  b[user_selection] = 'X'
end

WINNING_ROWS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

#check if there is a winner
def find_winner(b)
  WINNING_ROWS.each do |line|
    return "Player" if b.values_at(*line).count('X') == 3
    return "Computer" if b.values_at(*line).count('O') == 3
  end
  nil
end

#find the best available space for computer.
def find_best_space(b)
  WINNING_ROWS.each do |line|
    if line.select { |x| b[x] == 'O' }.length == 2 && line.select { |x| b[x] == ' ' }.length == 1
      choice_key = line.find { |i| b[i] == ' ' }
      return choice_key
    end
  end
  WINNING_ROWS.each do |line|
    if line.select { |x| b[x] == 'X' }.length == 2 && line.select { |x| b[x] == ' ' }.length == 1
      choice_key = line.find { |i| b[i] == ' ' }
      return choice_key
    end
  end
  choice_key = empty_spaces(b).keys.sample
  return choice_key
end

#computer selects a space
def computer_select_space(b)
  b[find_best_space(b)] = 'O'
end

#array of players
PLAYERS = ["Player", "Computer"]

continue_playing = 'y'

while continue_playing == 'y'

  #create a new board
  board = {}
  (1..9).each { |n| board[n] = " " }
  draw_board(board)

  #set the starting player
  starting_player = PLAYERS.sample
  puts "#{starting_player} will start."
  sleep 2

  if starting_player == "Player"
    until empty_spaces(board).empty? || find_winner(board)
      user_select_space(board)
      draw_board(board)
      computer_select_space(board)
      draw_board(board)
    end
  else
    computer_select_space(board)
    draw_board(board)
    until empty_spaces(board).empty? || find_winner(board)
      user_select_space(board)
      draw_board(board)
      computer_select_space(board)
      draw_board(board)
    end
  end

  if find_winner(board)
    puts "Winner: #{find_winner(board)}"
  elsif empty_spaces(board).empty?
    puts "It's a tie!"
  end

  puts "Would you like to play again?"

  continue_playing = gets.chomp.downcase

end



