require_relative "board"

class Game
  def initialize
    @board = load_board
    @player_name = create_player
  end

  def game_loop
    @board.render
    take_turn
  end

  def take_turn
    tile = select_tile
    puts "What number do you want to change this tile to?"
    input = gets.chomp.to_i
    @board.update_board(input, tile)
    system("clear")
    @board.render    
  end

  def select_tile
    loop do
      puts "Choose the row and column you want to change."
      puts "row:"
      row = gets.chomp.to_i
      puts "col:"
      col = gets.chomp.to_i
      
      return @board[row - 1, col - 1] if @board[row - 1, col - 1].given == false
      puts "Invalid choice, choose again."
      sleep(2)
    end
  end

  def load_board
    puts "Which sudoku puzzle do you want to solve?"
    puts "Enter the file name followed by .txt. (Must be located in the puzzles folder)"
    filename = gets.chomp

    Board.new(filename)
  end

  def create_player
    puts "What is your name, playa?"
    name = gets.chomp

    return name
  end
end