# frozen_string_literal: true

class Board
  def initialize
    fetch_player_names
  end

  def fetch_player_names
    puts 'What\'s player one\'s name?'
    @player1 = gets.chomp
    puts 'What\'s player two\'s name?'
    @player2 = gets.chomp
  end

  def create_board
    @board = [
      ['   ', '|', '   ', '|', '   ', "\n"],
      ['---', '+', '---', '+', '---', "\n"],
      ['   ', '|', '   ', '|', '   ', "\n"],
      ['---', '+', '---', '+', '---', "\n"],
      ['   ', '|', '   ', '|', '   ', "\n"]
    ]
    @key = [
      [' 1 ', '|', ' 2 ', '|', ' 3 ', "\n"],
      ['---', '+', '---', '+', '---', "\n"],
      [' 4 ', '|', ' 5 ', '|', ' 6 ', "\n"],
      ['---', '+', '---', '+', '---', "\n"],
      [' 7 ', '|', ' 8 ', '|', ' 9 ', "\n"]
    ]
  end

  def player_turn
    puts "#{@player1}'s turn!"
    puts 'Options:'
    puts 'Enter a number 1-9 to play.'
    puts 'Enter \'key\' to see which number corresponds to which square.'
    puts 'Enter \'board\' to see the current board.'
    gets.chomp
  end

  private

  def show_board
    display_board = @board.join
    puts display_board
  end

  def show_key
    display_board = @key.join
    puts display_board
  end
end

board = Board.new

board.player_turn
