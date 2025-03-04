class TicTacToe
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

  attr_accessor :board
  def initialize(board=[" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  def display_board
    # board.each_slice(3).map { |row| row.join(" | ") }.join("\n" + "-"*11 + "\n")
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
      user_input.to_i - 1
  end

  def move(index, play)
      board[index] = play
      board
  end

  def position_taken?(index)
    if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
       return true
    end
  end

  def turn_count
      counter = 0
      board.each do |spaces|
         if spaces == "X" || spaces == "O"
            counter += 1
         end
      end
      counter
  end

  def current_player
      turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |single_win_combo|
      win_index_1 = single_win_combo[0]
      win_index_2 = single_win_combo[1]
      win_index_3 = single_win_combo[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
        return single_win_combo
      end
    end

    return false
  end

  def full?
    if board.any? {|index| index == nil || index == " "}
      return false
    else
      return true
    end
  end

  def draw?
    if !won? && full?
      return true
    elsif !full? && !won?
      return false
    else won?
      return false
    end
  end

  def over?
    if draw? || won? || full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return board[won?[0]]
    end
  end

  def play
    counter = 0
    until counter == 9
    turn
    counter += 1
    end
  end


































end
