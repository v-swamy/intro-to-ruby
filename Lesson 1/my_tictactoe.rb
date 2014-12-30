
require 'pry'

#draw the board
def draw_board(board)
  system 'clear'
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts "---+---+---"
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts "---+---+---"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
end

#find empty spaces
def empty_spaces(board)
  board.select { |key,value| value == ' '}
end

#user selects a space
def user_select_space(board)
  puts "Select a space (1 - 9)"
  user_selection = gets.chomp.to_i
  while !empty_spaces(board).keys.include?(user_selection)
    puts "That space is taken! Please select another space (1 - 9)"
    user_selection = gets.chomp.to_i
  end
  board[user_selection] = 'X'
end

WINNING_ROWS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

#check if there is a winner
def find_winner(board)
  WINNING_ROWS.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

#find the best available space for computer.
def find_space_to_win(board, mark)
  WINNING_ROWS.each do |line|
    if line.select { |row| board[row] == mark }.length == 2 && line.select { |row| board[row] == ' ' }.length == 1
      choice_key = line.find { |space| board[space] == ' ' }
      return choice_key
    end
  end
  nil
end


#computer selects a space
def computer_select_space(board)
  if find_space_to_win(board, 'O')
    board[find_space_to_win(board, 'O')] = 'O'
  elsif find_space_to_win(board, 'X')
    board[find_space_to_win(board, 'X')] = 'O'
  else
    choice_key = empty_spaces(board).keys.sample
    board[choice_key] = 'O'
  end
end

#array of players
PLAYERS = ["Player", "Computer"]

continue_playing = 'y'

while continue_playing == 'y'

  #create a new board
  game_board = {}
  (1..9).each { |space| game_board[space] = " " }
  draw_board(game_board)

  #set the starting player
  starting_player = PLAYERS.sample
  puts "#{starting_player} will start."
  sleep 2

  if starting_player == "Player"
    until empty_spaces(game_board).empty? || find_winner(game_board)
      user_select_space(game_board)
      draw_board(game_board)
      computer_select_space(game_board)
      draw_board(game_board)
    end
  else
    computer_select_space(game_board)
    draw_board(game_board)
    until empty_spaces(game_board).empty? || find_winner(game_board)
      user_select_space(game_board)
      draw_board(game_board)
      computer_select_space(game_board)
      draw_board(game_board)
    end
  end

  if find_winner(game_board)
    puts "Winner: #{find_winner(game_board)}"
  elsif empty_spaces(game_board).empty?
    puts "It's a tie!"
  end

  puts "Would you like to play again?"

  continue_playing = gets.chomp.downcase

end



