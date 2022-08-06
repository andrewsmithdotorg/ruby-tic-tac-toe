# frozen_string_literal: true

class Board
  def initialize
    @player1_win = false
    @player2_win = false
    @draw = false
    @player1_turn = true
    @player2_turn = false
    fetch_player_names
    create_board
    run_game
  end

  private

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
      [' 7 ', '|', ' 8 ', '|', ' 9 ', "\n"],
      ['---', '+', '---', '+', '---', "\n"],
      [' 4 ', '|', ' 5 ', '|', ' 6 ', "\n"],
      ['---', '+', '---', '+', '---', "\n"],
      [' 1 ', '|', ' 2 ', '|', ' 3 ', "\n"]
    ]
  end

  def run_game
    until @player1_win || @player2_win || @draw
      play_turn
      check_if_end
      switch_player
    end
    end_game
  end

  def play_turn
    player_turn_instructions
    player_move = player_turn_options
    draw_move(player_move)
    show_board
  end

  def player_turn_instructions
    puts "\n"
    puts "#{@player1}'s turn!" if @player1_turn
    puts "#{@player2}'s turn!" if @player2_turn
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
      puts 'Invalid input.'
      input = gets.chomp
    end
    input
  end

  def validate_number_input(input)
    valid_inputs = %w[1 2 3 4 5 6 7 8 9]
    until valid_inputs.include?(input)
      puts 'Invalid input.  Please provide a number between 1 and 9.'
      input = gets.chomp
    end
    input
  end

  def show_board
    display_board = @board.join
    puts "\n"
    puts display_board
    puts "\n"
  end

  def show_key
    display_board = @key.join
    puts "\n"
    puts display_board
    puts "\n"
  end

  def draw_move(number)
    location = translate_input(number)
    until @board[location[0]][location[1]] == '   '
      puts 'That square is already taken.  New move?'
      number = validate_number_input(gets.chomp)
      location = translate_input(number)
    end
    @board[location[0]][location[1]] = ' X ' if @player1_turn
    @board[location[0]][location[1]] = ' O ' if @player2_turn
  end

  def translate_input(number)
    @board_translator = {
      '7' => [0, 0],
      '8' => [0, 2],
      '9' => [0, 4],
      '4' => [2, 0],
      '5' => [2, 2],
      '6' => [2, 4],
      '1' => [4, 0],
      '2' => [4, 2],
      '3' => [4, 4]
    }
    @board_translator[number]
  end

  def switch_player
    @player1_turn = @player1_turn.!
    @player2_turn = @player2_turn.!
  end

  def check_if_end
    player1_win_string = ' X  X  X '
    player2_win_string = ' O  O  O '
    @win_lines = [
      @board[0][0] + @board[0][2] + @board[0][4], # top row
      @board[2][0] + @board[2][2] + @board[2][4], # middle row
      @board[4][0] + @board[4][2] + @board[4][4], # bottom row
      @board[0][0] + @board[2][0] + @board[4][0], # left column
      @board[0][2] + @board[2][2] + @board[4][2], # middle column
      @board[0][4] + @board[2][4] + @board[4][4], # right column
      @board[0][0] + @board[2][2] + @board[4][4], # TL -> BR diag
      @board[0][4] + @board[2][2] + @board[4][0] # TR -> BL diag
    ]
    @player1_win = true if @win_lines.include?(player1_win_string)
    @player2_win = true if @win_lines.include?(player2_win_string)
    @draw = true unless @board.flatten.include?('   ')
  end

  def end_game
    if @player1_win
      puts "\nNice job #{@player1}, you won!  Although to be fair...kinda hard for player 1 to lose."
    elsif @player2_win
      puts "\nNice job #{@player2}, you won!"
    elsif @draw
      puts "\nIt's a draw!  Isn't tic-tac-toe fun?"
    end
  end
end

board = Board.new
