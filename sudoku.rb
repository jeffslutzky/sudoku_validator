def valid?(array)
  return array.sort == [1, 2, 3, 4, 5, 6, 7, 8, 9]
end

def create_rows(board, arrays_to_validate)
  i = 0
  while i < 9 do
    row = []
    j = 0
    while j < 9 do
      row << board[i][j]
      j += 1
    end
    arrays_to_validate << row
    i += 1
  end
end

def create_columns(board, arrays_to_validate)
  i = 0
  while i < 9 do
    column = []
    j = 0
    while j < 9 do
      column << board[j][i]
      j += 1
    end
    arrays_to_validate << column
    i += 1
  end
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

def create_squares(board, arrays_to_validate)
  arrays_to_validate << create_square(board, 0, 0)
  arrays_to_validate << create_square(board, 3, 0)
  arrays_to_validate << create_square(board, 6, 0)
  arrays_to_validate << create_square(board, 0, 3)
  arrays_to_validate << create_square(board, 3, 3)
  arrays_to_validate << create_square(board, 6, 3)
  arrays_to_validate << create_square(board, 0, 6)
  arrays_to_validate << create_square(board, 3, 6)
  arrays_to_validate << create_square(board, 6, 6)
end

def validate_board(board)
  arrays_to_validate = []
  create_rows(board, arrays_to_validate)
  create_columns(board, arrays_to_validate)
  create_squares(board, arrays_to_validate)
  arrays_to_validate.each do |array|
    if not valid?(array)
      puts "Board is not valid!"
      return false
    end
  end
  puts "Board is valid!"
end



valid_board = [
  [1,2,3,4,5,6,7,8,9],
  [4,5,6,7,8,9,1,2,3],
  [7,8,9,1,2,3,4,5,6],
  [2,3,4,5,6,7,8,9,1],
  [5,6,7,8,9,1,2,3,4],
  [8,9,1,2,3,4,5,6,7],
  [3,4,5,6,7,8,9,1,2],
  [6,7,8,9,1,2,3,4,5],
  [9,1,2,3,4,5,6,7,8]
]

invalid_board = [
  [1,2,3,4,5,6,7,8,9],
  [4,5,6,7,8,9,1,2,3],
  [7,8,9,1,2,3,4,5,6],
  [2,3,4,5,6,7,8,9,1],
  [5,6,7,8,9,1,2,3,4],
  [8,9,1,2,3,4,5,6,7],
  [3,4,5,6,7,8,9,1,2],
  [6,7,8,9,1,2,3,4,5],
  [9,1,2,3,4,5,6,7,9]
]

validate_board(valid_board)
validate_board(invalid_board)
