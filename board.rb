require_relative 'tile'

class Board
  attr_reader :grid_size, :num_bombs

  def initialize(grid_size, num_bombs)
    @grid_size, @num_bombs = grid_size, num_bombs

    generate_board
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def lost?
    @grid.flatten.any? { |tile| tile.bombed? && tile.explored? }
  end

  def render(reveal = false)
    # reveal is used to fully reveal the board at game end
    @grid.map do |row|
      row.map do |tile|
        reveal ? tile.reveal : tile.render
      end.join("")
    end.join("\n")
  end

  def reveal
    render(true)
  end

  def won?
    @grid.flatten.all? { |tile| tile.bombed? != tile.explored? }
  end


end

