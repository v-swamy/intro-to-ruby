class GameBoard
  attr_accessor :board

  WINNING_ROWS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize
    @board = {}
    self.reset_board
  end

  def reset_board
    (1..9).each { |space| self.board[space] = " " }
  end

  def draw_board
    system 'clear'
    puts " #{self.board[1]} | #{self.board[2]} | #{self.board[3]} "
    puts "---+---+---"
    puts " #{self.board[4]} | #{self.board[5]} | #{self.board[6]} "
    puts "---+---+---"
    puts " #{self.board[7]} | #{self.board[8]} | #{self.board[9]} "
  end

  def empty_spaces
    self.board.select { |key,value| value == ' '}
  end
end

class Player
  def user_select_space(game_board)
    puts "Select a space (1 - 9)"
    selection = gets.chomp.to_i
    while !game_board.empty_spaces.keys.include?(selection)
      puts "That space is taken! Please select another space (1 - 9)"
      selection = gets.chomp.to_i
    end
    game_board.board[selection] = 'X'
  end

  def find_space_to_win(game_board, mark)
    GameBoard::WINNING_ROWS.each do |line|
      if line.select { |row| game_board.board[row] == mark }.length == 2 && 
         line.select { |row| game_board.board[row] == ' ' }.length == 1
        choice_key = line.find { |space| game_board.board[space] == ' ' }
        return choice_key
      end
    end
    nil
  end

  def computer_select_space(game_board)
    if self.find_space_to_win(game_board, 'O')
      game_board.board[find_space_to_win(game_board, 'O')] = 'O'
    elsif self.find_space_to_win(game_board, 'X')
      game_board.board[find_space_to_win(game_board, 'X')] = 'O'
    else
      choice_key = game_board.empty_spaces.keys.sample
      game_board.board[choice_key] = 'O'
    end
  end
end

class Game
  attr_reader :player, :computer, :game_board
  PLAYERS = ["Player", "Computer"]

  def initialize
    @player = Player.new
    @computer = Player.new
    @game_board = GameBoard.new
  end

  def find_winner(game_board)
    GameBoard::WINNING_ROWS.each do |line|
      return "Player" if game_board.board.values_at(*line).count('X') == 3
      return "Computer" if game_board.board.values_at(*line).count('O') == 3
    end
    nil
  end

  def play
    continue_playing = 'y'
    while continue_playing == 'y'
      self.game_board.reset_board
      self.game_board.draw_board
      starting_player = PLAYERS.sample
      puts "#{starting_player} will start."
      sleep 2

      if starting_player == "Player"
        until self.game_board.empty_spaces.empty? || self.find_winner(self.game_board)
          player.user_select_space(self.game_board)
          self.game_board.draw_board
          computer.computer_select_space(self.game_board)
          self.game_board.draw_board
        end
      else
        computer.computer_select_space(self.game_board)
        self.game_board.draw_board
        until self.game_board.empty_spaces.empty? || self.find_winner(self.game_board)
          player.user_select_space(self.game_board)
          self.game_board.draw_board
          computer.computer_select_space(self.game_board)
          self.game_board.draw_board
        end
      end

      if self.find_winner(self.game_board)
        puts "Winner: #{self.find_winner(self.game_board)}"
      elsif self.game_board.empty_spaces.empty?
        puts "It's a tie!"
      end

      puts "Would you like to play again?"
      continue_playing = gets.chomp.downcase
    end

    system 'clear'
    puts 'Thanks for playing!'
  end
end

new_game = Game.new.play


