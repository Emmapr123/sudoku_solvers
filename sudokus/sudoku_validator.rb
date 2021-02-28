# check if a sudoku has been solved correctly
# a sudoku consists of rows, columns, and blocks of 3 x 3
board = [[1, 3, 2, 5, 7, 9, 4, 6, 8], [4, 9, 8, 2, 6, 1, 3, 7, 5], [7, 5, 6, 3, 8, 4, 2, 1, 9], [6, 4, 3, 1, 5, 8, 7, 9, 2], [5, 2, 1, 7, 9, 3, 8, 4, 6], [9, 8, 7, 4, 2, 6, 5, 3, 1], [2, 1, 4, 9, 3, 5, 6, 8, 7], [3, 6, 5, 8, 1, 7, 9, 2, 4], [8, 7, 9, 6, 4, 2, 1, 3, 5]]

def validSolution(board)
  row(board) && row(board.transpose) && square(board)
end

def row(board)
  board.all? { |row| row.sum == 45 }
end

def square(board)
  row = 0
  column = 0
  squares = []
  until row == 9
    until column == 9
      squares << board[column..(column + 2)].map { |r| r[row..(row + 2)] }.flatten
      column += 3
    end
    column = 0
    row += 3
  end

  squares.all? { |square| square.sum == 45 }
end

validSolution(board)
