# makes an array of the missing numbers per given input
def find_missing(array)
  missing_numbers = []
  all_numbers = (1..9).to_a
  all_numbers.map { |number|
    if !array.include?(number)
      missing_numbers << number
    end
  }
  missing_numbers.compact
end

# makes an array for the missing numbers per row
def row_check(puzzle)
  puzzle.map { |row|
    find_missing(row)
  }
end

# makes an array for the missing numbers per column
def col_check(puzzle)
  puzzle.transpose.map { |column|
    find_missing(column)
  }
end

def make_squares(puzzle)
  #first I make and array of arrays that represents each square
  row = 0
  column = 0
  squares = []
  until row == 9
    until column == 9
      squares << puzzle[column..(column + 2)].map { |r| r[row..(row + 2)] }.flatten
      column += 3
    end
    column = 0
    row += 3
  end
  squares
end

def square_check(puzzle)
  squares = make_squares(puzzle)
  # and then I find the missing ones
  squares.map { |square|
    find_missing(square)
  }

end

# finds the location of the missing numbers
def get_coords(puzzle)
  coords = []

  puzzle.each.with_index { |row, index_1|
    row.map.with_index { |column, index_2|
      if (column == 0)
        coords << [index_1, index_2]
      end
    }

  }
  # this is useful to find out where to input my new numbers
  coords
end

def solve_pieces(puzzle)
  #let's assemble what we found out in the previous methods

  puzzle_update = puzzle
  missing_in_row= row_check(puzzle)
  missing_in_column = col_check(puzzle)
  missing_in_square = square_check(puzzle)
  coords = get_coords(puzzle)
  in_both = []
  coords_map = []
  coords.map { |location|
    row_of_location = missing_in_row[location[0]]
    column_of_location = missing_in_column[location[1]]
    # the numbers that are missing in both row and column
    in_both << row_of_location & column_of_location
    # in a hash with their coordinates
    coords_map << {"coord" => location, "numbers" => row_of_location & column_of_location}

  }
  # solve the easiest zero's
  if coords_map.length > 0
    coords_map.each { |coord_obj|
      if coord_obj["numbers"].length == 1
        puzzle[coord_obj["coord"][0]][coord_obj["coord"][1]] = coord_obj["numbers"][0]
      end
    }
  end
  # update the puzzle with the first zero's solved
  puzzle_update

end

def sudoku_solver(puzzle)
  updated_puzzle = solve_pieces(puzzle)
  coords = get_coords(updated_puzzle)

  # loop over it until there are no coords left!
  while coords.length > 0
    updated_puzzle = solve_pieces(updated_puzzle)
    coords = get_coords(updated_puzzle)
  end

  updated_puzzle
end
