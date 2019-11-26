class Board
  attr_accessor :cells
  
  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def position(user_input)
    index = user_input.to_i - 1
    @cells[index]
  end
  
  def full?
    cells.each do |cell|
      if cell == " " || cell == "" || cell == nil
        return false
      end
    end
    return true
  end
  
  def turn_count
    counter = 0 
    cells.each do |cell| 
      if cell == "X" || cell == "O"
        counter += 1 
      end
    end
    return counter
  end
  
  def taken?(index)
    index = index.to_i - 1
    !(cells[index].nil? || cells[index] == " ")
  end

  def valid_move?(string_index)
    return false unless string_index =~ /^[0-9]+$/
    index = string_index.to_i - 1
    index.between?(0,8) && !taken?(string_index)
  end
  
  def update(input, player)
    index = input_to_index(input)
    @cells[index] = player.token
  end

end