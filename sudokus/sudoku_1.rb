#finish a simple sudoku, only one per array missing

def sudokuer(puzzle)
  # mapping will take the 9 arrays appart and look at them individually
  puzzle.map { |row|
    row[row.index(0)] = (45 - row.sum) #row.index(0) will locate 0
  }
  puzzle
end
