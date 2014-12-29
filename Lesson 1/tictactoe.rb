
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

require 'pry'

def initialize_board
  b = {}
  (1..9).each {|position| b[position] = ' '}
  b
end

def draw_board(b)
  system 'clear'
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "---+---+---"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "---+---+---"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

def empty_positions(b)
  b.select { |k, v| v == ' ' }.keys
end


def player_picks_square(b)
  puts "Pick a square (from 1 to 9)"
  position = gets.chomp.to_i
  b[position] = 'X'
end

def computer_picks_square(b)
  position = empty_positions(b).sample
  b[position] = 'O'
end

def 


board = initialize_board
draw_board(board)

begin
  player_picks_square(board)
  draw_board(board)
  computer_picks_square(board)
  draw_board(board) 
end until winner || board_full?