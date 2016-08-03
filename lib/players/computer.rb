module Players
class Computer < Player

 def initialize(token)
  @token = token
 end 

 def move(board)
      if !board.taken?('5')
        '5'
      else
        best_move(board) + 1
      end
    end

  def best_move(board)
    block(board) || win(board) || take_corner(board) || random
  end

  def win(board)
    winning_space?(board, token)
  end

  def winning_space?(board, token)
  winning_combo = Game::WIN_COMBINATIONS.detect do |win_combo|
    combo = win_combo.map do |position|
      board.cells[position]
    end
    combo.count(token) == 2 && combo.count(" ") == 1
  end

  if winning_combo
    winning_combo.detect{|index| !board.taken?(index+1)}
  else
    false
  end
 end

 def block(board)
    blocking_space?(board, token)
 end

 def another_token
  self.token == "X" ? "O" : "X"
 end

 def blocking_space?(board, token)
  winning_combo = Game::WIN_COMBINATIONS.detect do |win_combo|
    combo = win_combo.map do |position|
      board.cells[position]
    end
    combo.count(another_token) == 2 && combo.count(" ") == 1
  end
  if winning_combo
    winning_combo.detect{|index| !board.taken?(index+1)}
  else
    false
  end
 end

  def take_corner(board) 
    [0, 2, 6, 8].detect {|index| !board.taken?(index+1)}
  end

  def random
    rand(0..8)
  end


end
end