# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

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

# board = ["X","O","X","O","O","X","O","X","O"]
# board = ["X","X","X","O","O","X","O","X","O"]
# board = [" "," "," "," "," "," "," "," ","O"]

def won?(board)
  WIN_COMBINATIONS.each do |x|
    if board[x[0]] == "X" && board[x[1]] == "X" && board[x[2]] == "X"
      champ = "X"
      return x
    elsif board[x[0]] == "O" && board[x[1]] == "O" && board[x[2]] == "O"
      return x
    end
  end
  return
end

def full?(board)
  board.all? do |y|
    y == "X" or y == "O"
  end
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    return true
  elsif won?(board) == nil && full?(board) == false
    return false
  elsif won?(board) == true
    return false
  end
end

def over?(board)
  if won?(board) or draw?(board) or full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == nil
    return nil
  else
    win_combo = won?(board)
    return board[win_combo[0]]
  end
end
