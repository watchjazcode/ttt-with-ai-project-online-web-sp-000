class Game
  
  attr_accessor :player_1, :player_2, :board
  
  def initialize(player_1 = "X", player_2 = "O", board = [])
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
  
  
  
end