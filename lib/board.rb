class Board

attr_accessor :cells, :valid_moves

def initialize
   reset!
end

def reset!
  @cells = Array.new(9, " ")
  @valid_moves = (1..9).to_a
end

def display
  puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
  puts "-----------"
  puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
  puts "-----------"
  puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
end

def position(user_input)
  self.cells[user_input.to_i-1]
end

def full?
  self.cells.include?(" " || "")? false : true
end

def turn_count
   @cells.count {|cell| cell == "X" || cell == "O"}
end

def taken?(position)
  @cells[position.to_i-1] == "X" || @cells[position.to_i-1] == "O"
end

def valid_move?(input)
 if input.to_i.between?(1,9) && !taken?(input)
  true
else
  puts "Please enter valid move"
end
end

def update(position, player)
  @cells[position.to_i-1] = player.token
end


end







