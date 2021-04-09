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

  #Each row, each column and each 3x3 grid
  #Has to have different numbers from eaach other.
  def solved?
    return false if check_rows? == false
    return false if check_columns? == false
    return false if check_grids? == false
    return true
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

  def check_rows?
    @grid.each do |row|
      used_numbers = []
      row.each do |tile|
        if used_numbers.include?(tile.value) || tile.value < 1 || tile.value > 9
          return false
        end
        used_numbers << tile.value
      end
    end
    return true
  end

  def check_columns?
    col_array = []
    (0..@grid.length - 1).each do |num|
      col_array = []
      @grid.each do |row|
        if col_array.include?(row[num].value) || row[num].value < 1 || row[num].value > 9
          return false
        end

        col_array << row[num].value
      end
    end
    return true
  end

  def check_grids?
    return false if check_top_left_grid? == false
    return false if check_top_mid_grid? == false
    return false if check_top_right_grid? == false
    return false if check_mid_left_grid? == false
    return false if check_mid_grid? == false
    return false if check_mid_right_grid? == false
    return false if check_bottom_left_grid? == false
    return false if check_bottom_mid_grid? == false
    return false if check_bottom_right_grid? == false
    return true
  end

  def check_top_left_grid?
    grid_numbers = []
    (0...3).each do |num|
      (0...3).each do |other_num|
        tile = self[num, other_num]
        if grid_numbers.include?(tile.value)
          return false
        end
        grid_numbers << tile.value
      end
    end
    return true
  end

  def check_top_mid_grid?
    grid_numbers = []
    (0...3).each do |num|
      (3...6).each do |other_num|
        tile = self[num, other_num]
        if grid_numbers.include?(tile.value)
          return false
        end
        grid_numbers << tile.value
      end
    end
    return true
  end

  def check_top_right_grid?
    grid_numbers = []
    (0...3).each do |num|
      (6...9).each do |other_num|
        tile = self[num, other_num]
        if grid_numbers.include?(tile.value)
          return false
        end
        grid_numbers << tile.value
      end
    end
    return true
  end

  def check_mid_left_grid?
    grid_numbers = []
    (3...6).each do |num|
      (0...3).each do |other_num|
        tile = self[num, other_num]
        if grid_numbers.include?(tile.value)
          return false
        end
        grid_numbers << tile.value
      end
    end
    return true
  end

  def check_mid_grid?
    grid_numbers = []
    (3...6).each do |num|
      (3...6).each do |other_num|
        tile = self[num, other_num]
        if grid_numbers.include?(tile.value)
          return false
        end
        grid_numbers << tile.value
      end
    end
    return true
  end

  def check_mid_right_grid?
    grid_numbers = []
    (3...6).each do |num|
      (6...9).each do |other_num|
        tile = self[num, other_num]
        if grid_numbers.include?(tile.value)
          return false
        end
        grid_numbers << tile.value
      end
    end
    return true
  end

  def check_bottom_left_grid?
    grid_numbers = []
    (6...9).each do |num|
      (0...3).each do |other_num|
        tile = self[num, other_num]
        if grid_numbers.include?(tile.value)
          return false
        end
        grid_numbers << tile.value
      end
    end
    return true
  end

  def check_bottom_mid_grid?
    grid_numbers = []
    (6...9).each do |num|
      (3...6).each do |other_num|
        tile = self[num, other_num]
        if grid_numbers.include?(tile.value)
          return false
        end
        grid_numbers << tile.value
      end
    end
    return true
  end

  def check_bottom_right_grid?
    grid_numbers = []
    (6...9).each do |num|
      (6...9).each do |other_num|
        tile = self[num, other_num]
        if grid_numbers.include?(tile.value)
          return false
        end
        grid_numbers << tile.value
      end
    end
    return true
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, value)
    @grid[row][col] = value
  end
end