require 'colorize'

class Tile
  attr_reader :value, :given
  def initialize(value, given)
    @value = value

    # true/false
    @given = given
  end

  def to_s
    if @given == true
      @value.to_s.colorize(:cyan)
    else
      @value.to_s
    end
  end

  def change_value(value)
    @value = value
  end
end