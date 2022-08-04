# frozen_string_literal: true

class Board
  def initialize
    @player1_win = false
    @player2_win = false
    @draw = false
    fetch_player_names
    create_board
    run_game
  end

  def fetch_player_names
    puts 'What\'s player one\'s name?'
    @player1 = gets.chomp
    puts 'What\'s player two\'s name?'
    @player2 = gets.chomp
  end

  def create_board
    @board = [
      [' X ', '|', ' X ', '|', '   ', "\n"],
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

  def run_game
    play_turn
    check_if_end # add a victory/draw checker function, invoke at end of play_turn to set a flag as true if game is over
    # run play_turn inside an unless loop that checks whether it has become true that game is complete
    # at end of turn, invoke a 'switch player' function to change between P1 and P2
  end

  private

  def play_turn
    player_turn_instructions
    player_move = player_turn_options
    draw_move(player_move)
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
    @board_translator = {
      '1' => [0, 0],
      '2' => [0, 2],
      '3' => [0, 4],
      '4' => [2, 0],
      '5' => [2, 2],
      '6' => [2, 4],
      '7' => [4, 0],
      '8' => [4, 2],
      '9' => [4, 4]
    }
    @board_translator[number]
  end

  def check_if_end
    player1_win_string = " X  X  X "
    player2_win_string = " O  O  O "
    @win_lines = [
      @board[0][0] + @board[0][2] + @board[0][4], # top row
      @board[2][0] + @board[2][2] + @board[2][4], # middle row
      @board[4][0] + @board[4][2] + @board[4][4], # bottom row
      @board[0][0] + @board[2][0] + @board[4][0], # left column
      @board[0][2] + @board[2][2] + @board[4][2], # middle column
      @board[0][4] + @board[2][4] + @board[4][4], # right column
    ]
    if @win_lines.include?(player1_win_string)
      puts "win"
    end
  end
end

board = Board.new
