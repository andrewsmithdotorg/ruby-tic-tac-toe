# frozen_string_literal: true

class Board
  def initialize
    fetch_player_names
    create_board
    play_turn # add a victory/draw checker function, invoke at end of play_turn to set a flag as true if game is over
    # run play_turn inside an unless loop that checks whether it has become true that game is complete
    # at end of turn, invoke a 'switch player' function to change between P1 and P2
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

  private

  def play_turn
    player_turn_instructions
    move = player_turn_options
    draw_move(move)
    show_board
  end

  def player_turn_instructions
    puts "\n"
    puts "#{@player1}'s turn!"
    puts 'Options:'
    puts 'Enter a number 1-9 to play.'
    puts 'Enter \'key\' to see which number corresponds to which square.'
    puts 'Enter \'board\' to see the current board.'
  end

  def player_turn_options
    exit_loop = false
    while exit_loop == false
      input = validate_input(gets.chomp)
      case input
      when 'board'
        show_board
      when 'key'
        show_key
      else
        exit_loop = true
      end
    end
    input
  end

  def validate_input(input)
    valid_inputs = %w[key board 1 2 3 4 5 6 7 8 9]
    until valid_inputs.include?(input)
      puts 'invalid input.'
      input = gets.chomp
    end
    input
  end

  def show_board
    display_board = @board.join
    puts display_board
  end

  def show_key
    display_board = @key.join
    puts display_board
  end

  def draw_move(number)
    location = translate_input(number)
    @board[location[0]][location[1]] = ' X '
  end

  def translate_input(number)
    case number
    when '1'
      [0, 0]
    when '2'
      [0, 2]
    when '3'
      [0, 4]
    when '4'
      [2, 0]
    when '5'
      [2, 2]
    when '6'
      [2, 4]
    when '7'
      [4, 0]
    when '8'
      [4, 2]
    when '9'
      [4, 4]
    end
  end
end

board = Board.new
