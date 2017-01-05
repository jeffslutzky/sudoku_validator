require 'pry'

board = [
  [1,2,3,4,5,6,7,8,9],
  [4,5,6,7,7,9,1,2,3],
  [7,8,9,1,2,3,4,5,6],
  [2,3,4,5,6,7,8,9,1],
  [5,6,7,8,9,1,2,3,4],
  [8,9,1,2,3,4,5,6,7],
  [3,4,5,6,7,8,9,1,2],
  [6,7,8,9,1,2,3,4,5],
  [9,1,2,3,4,5,6,7,8]
]

def valid?(array)
  return array.sort == [1, 2, 3, 4, 5, 6, 7, 8, 9]
end

def create_square(board, row_index, column_index)
  square = []
  i = row_index
  while i < row_index + 3 do
    j = column_index
    while j < column_index + 3 do
      square << board[i][j]
      j += 1
    end
    i += 1
  end
  return square
end

def test_squares(board)
  array_of_squares = []
  array_of_squares << create_square(board, 0, 0)
  array_of_squares << create_square(board, 3, 0)
  array_of_squares << create_square(board, 6, 0)
  array_of_squares << create_square(board, 0, 3)
  array_of_squares << create_square(board, 3, 3)
  array_of_squares << create_square(board, 6, 3)
  array_of_squares << create_square(board, 0, 6)
  array_of_squares << create_square(board, 3, 6)
  array_of_squares << create_square(board, 6, 6)
  array_of_squares.each do |square|
    if valid?(square)
      puts "valid square"
    else
      puts "invalid square"
      return false
    end
  end
end

def test_columns(board)
  i = 0
  while i < 9 do
    column = []
    j = 0
    while j < 9 do
      column << board[j][i]
      j += 1
    end
    print column
    if valid?(column)
      puts "valid column"
      i += 1
    else
      puts "invalid column"
      return false
    end
  end
end

def test_rows(board)
  i = 0
  while i < 9 do
    row = []
    j = 0
    while j < 9 do
      row << board[i][j]
      j += 1
    end
    print row
    if valid?(row)
      puts "valid row"
      i += 1
    else
      puts "invalid row"
      return false
    end
  end
end

def test_board(board)
  test_rows(board)
  test_columns(board)
  test_squares(board)
end

test_board(board)
