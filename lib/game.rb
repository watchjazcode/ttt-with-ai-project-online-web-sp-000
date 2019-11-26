class Game
  
  attr_accessor :player_1, :player_2, :board
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
  
  def current_player
    turn_count % 2 == 0 ? player_1 : player_2
  end

  def position_taken?(location)
    @board.cells[location] != " " && @board.cells[location] != ""
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(@board)
    until board.valid_move?(input)
      puts "Please enter 1-9:"
      input = current_player.move(@board)
    end
    @board.update(input, current_player)
    @board.display
  end

  def turn_count
    @board.cells.count{|token| token == "X" || token == "O"}
  end

  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return nil
  end
  
  def full?
    @board.cells.each do | cell |
      if cell == " " || cell == "" || cell == nil
        return false
      end
    end
    return true
  end
  
  def draw?
    if !won?
      if full?
        return true
      else
        return false
      end
    else 
      false
    end
  end
  
  def over?
    if full? || won? || draw?
      return true
    end
  end
  
  def winner
    result = won? # <= giving back winning pattern
    if result == nil 
      return nil
    else
      index = result[0] 
      return @board.cells[index] 
    end
  end
  
  def play
    until over? # keep repeating until game is over
      turn
    end
    if won?
      winner_winner_chicken_dinner = won?
      if winner_winner_chicken_dinner == true
        puts "Congratulations"
      else
        character = @board.cells[winner_winner_chicken_dinner[0]]
        puts "Congratulations #{character}!"
      end
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

