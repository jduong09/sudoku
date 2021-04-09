require 'colorize'

class Tile
  attr_reader :value
  def initialize(value, given)
    @value = value

    # true/false
    @given = given
  end

  def to_s
    if @given == true
      @value.to_s.colorize(:red)
    else
      @value.to_s
    end
  end
end