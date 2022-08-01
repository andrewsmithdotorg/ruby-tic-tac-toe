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
    play_turn
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

  private

  def play_turn
    input = player_turn_instructions
    validate_input(input)
  end

  def validate_input(input)
    valid_inputs = %w[key board 1 2 3 4 5 6 7 8 9]
    until valid_inputs.include?(input)
      puts 'invalid input.'
      input = gets.chomp
    end
    puts input
  end

  def player_turn_instructions
    puts "\n"
    puts "#{@player1}'s turn!"
    puts 'Options:'
    puts 'Enter a number 1-9 to play.'
    puts 'Enter \'key\' to see which number corresponds to which square.'
    puts 'Enter \'board\' to see the current board.'
    gets.chomp
  end

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
