# frozen_string_literal: true

class Board
  def initialize
    @board = [
      ['   ', '|', '   ', '|', '   ', "\n"],
      ['---', '+', '---', '+', '---', "\n"],
      ['   ', '|', '   ', '|', '   ', "\n"],
      ['---', '+', '---', '+', '---', "\n"],
      ['   ', '|', '   ', '|', '   ', "\n"]
    ]
  end

  def convert_to_string
    @board.join
  end

  def show_board
    display_board = convert_to_string
    puts display_board
  end

  def check_if_muted
    puts @board
  end
end

board = Board.new

board.show_board
