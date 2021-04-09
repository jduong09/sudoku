require_relative "tile"

class Board
  attr_reader :grid

  def initialize(filename)
    @grid = from_file(filename)
  end

  def from_file(filename)
    array = []
    File.foreach("puzzles/#{filename}") do |line|
      array_line = []
      line.each_char do |char| 
        next if char == "\n"

        if char == "0"
          tile = Tile.new(char.to_i, false)
          array_line << tile
          next
        end

        tile = Tile.new(char.to_i, true)
        array_line << tile 
      end
      array << array_line
    end

    return array
  end

  def solved?

  end

  def render
    string = ""
    @grid.each do |row|
      row_string = ""
      row.each do |col|
        if col.is_a?(String)
          row_string += col + " " 
        else
          row_string += col.to_s + " " 
        end
      end
      row_string += "\n"
      string += row_string
    end
    puts string
  end

  def update_board(input, tile)
    tile.change_value(input)
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, value)
    @grid[row][col] = value
  end
end