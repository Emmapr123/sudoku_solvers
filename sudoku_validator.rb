# check if a sudoku has been solved correctly
# a sudoku consists of rows, columns, and blocks of 3 x 3
board = [[1, 3, 2, 5, 7, 9, 4, 6, 8], [4, 9, 8, 2, 6, 1, 3, 7, 5], [7, 5, 6, 3, 8, 4, 2, 1, 9], [6, 4, 3, 1, 5, 8, 7, 9, 2], [5, 2, 1, 7, 9, 3, 8, 4, 6], [9, 8, 7, 4, 2, 6, 5, 3, 1], [2, 1, 4, 9, 3, 5, 6, 8, 7], [3, 6, 5, 8, 1, 7, 9, 2, 4], [8, 7, 9, 6, 4, 2, 1, 3, 5]]

def validSolution(board)
  true_or_false = []
  true_or_false << board.map { |row| row.sum != 45 ? false : true }.all?(true)
  true_or_false << board.transpose.map { |col| col.sum != 45 ? false : true }.all?(true)

  row = 0
  column = 0
  squares = []

def quares(board)
  until row == 9
    until column == 9
      squares << board[column..(column + 2)].map { |r| r[row..(row + 2)] }.flatten
      column += 3
    end
    column = 0
    row += 3
  end

  squares.map { |square| square.sum == 45 ? true_or_false << true : true_or_false << false }
end

print validSolution(board)


# def square(board)
#   end_of_check_row = board.map.with_index { |row,index| (index + 1) % 3 == 0 ? true : false}
#
#   end_of_check_col = board.transpose.map.with_index { |row,index| (index + 1) % 3 == 0 ? true : false}
#
#   puts end_of_check_col
#   puts end_of_check_row
#
#   each_square = []
#   while true do
#
#   end
#
# end

# def validSolution(board)
#   true_or_false = []
#   print board
#
#   range_column = (0..8).to_a
#   range_left = (0..2).to_a
#   range_mid = (3..5).to_a
#   range_right = (6..8).to_a
#
#
#   column = board.transpose.map { |arr| check_array(arr)}.all?(true)
#   true_or_false << column
#
#   row = board.map { |arr| check_array(arr) }.all?(true)
#   true_or_false << row
#
#   quad_left_top = board[0..2].map.with_index { |array,index|
#     range_left.map { |num| array[num]}
#   }.flatten
#   quad_left_mid = board[3..5].map.with_index { |array,index|
#     range_left.map { |num| array[num]}
#   }.flatten
#   quad_left_down = board[6..8].map.with_index { |array,index|
#     range_left.map { |num| array[num]}
#   }.flatten
#
#   true_or_false << check_array(quad_left_top)
#   true_or_false << check_array(quad_left_mid)
#   true_or_false << check_array(quad_left_down)
#
#   quad_mid_top = board[0..2].map.with_index { |array,index|
#     range_mid.map { |num| array[num]}
#   }
#   quad_mid_mid = board[3..5].map.with_index { |array,index|
#     range_mid.map { |num| array[num]}
#   }
#   quad_mid_down = board[6..8].map.with_index { |array,index|
#     range_mid.map { |num| array[num]}
#   }
#
#
#
#   quad_right_top = board[0..2].map.with_index { |array,index|
#     range_right.map { |num|
#       array[num]}
#   }
#   quad_right_mid = board[3..5].map.with_index { |array,index|
#     range_right.map { |num|
#       array[num]}
#   }
#   quad_right_down = board[6..8].map.with_index { |array,index|
#     range_right.map { |num|
#       array[num]}
#   }
#
#   true_or_false.all?(true)
#
#
#
#
#
# end
