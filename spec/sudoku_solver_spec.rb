require_relative '../sudokus/sudoku_2.rb'

puzzle = [  [0, 5, 2, 3, 9, 1, 8, 7, 6],
                                                                    [3, 1, 8, 6, 7, 5, 0, 9, 4],
                                                                    [6, 7, 9, 4, 2, 8, 3, 1, 5],
                                                                    [0, 3, 1, 5, 6, 0, 7, 2, 9],
                                                                    [2, 4, 5, 9, 8, 7, 1, 6, 3],
                                                                    [9, 6, 0, 2, 1, 3, 5, 4, 8],
                                                                    [7, 9, 6, 8, 5, 2, 4, 3, 1],
                                                                    [1, 8, 0, 7, 4, 9, 6, 5, 2],
                                                                    [5, 2, 4, 1, 3, 6, 9, 8, 0]]

solution =
[  [4, 5, 2, 3, 9, 1, 8, 7, 6],
                                                                    [3, 1, 8, 6, 7, 5, 2, 9, 4],
                                                                    [6, 7, 9, 4, 2, 8, 3, 1, 5],
                                                                    [8, 3, 1, 5, 6, 4, 7, 2, 9],
                                                                    [2, 4, 5, 9, 8, 7, 1, 6, 3],
                                                                    [9, 6, 7, 2, 1, 3, 5, 4, 8],
                                                                    [7, 9, 6, 8, 5, 2, 4, 3, 1],
                                                                    [1, 8, 3, 7, 4, 9, 6, 5, 2],
                                                                    [5, 2, 4, 1, 3, 6, 9, 8, 7]]

describe '#sudoku_solver' do

  describe 'find_missing' do
    context 'should return an array of missing numbers' do
      subject { find_missing([0, 5, 2, 3, 9, 1, 8, 7, 6])}

      it { should eq([4])}
    end
  end

  describe 'row_check' do
    context 'should return [4] for the top 2 rows' do
      subject { row_check(puzzle)}
                                                                it { should eq([[4], [2], [], [4, 8], [], [7], [], [3], [7]])}
    end
  end

  describe 'column_check' do
    context 'should return missing numbers in columns' do
      subject { col_check(puzzle)}
                                                                 it { should eq([[4, 8], [], [3, 7], [], [], [4], [2], [], [7]])}
    end
  end

  describe 'square_check' do
    context 'should find missing numbers in squares' do
      subject { square_check(puzzle)}

      it { should eq([[4], [7, 8], [3], [], [4], [], [2], [], [7]])}
    end
  end

  describe 'get_coords' do
    context ' find the coordinates of the missing numbers' do
      subject { get_coords(puzzle)}

      it { should eq( [[0, 0], [1, 6], [3, 0], [3, 5], [5, 2], [7, 2], [8, 8]])}
    end
  end

  describe 'sudoku_solver' do
    context 'check in both rown and column' do
      subject { sudoku_solver(puzzle)}

      it { should eq(solution)}
    end
  end

end
