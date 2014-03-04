class TicTacToe
  X_MARKER = "x".downcase
  O_MARKER = "o".downcase
  EMPTY_SPACE = "-"

  def initialize(file)
    @file = file
    @winner = winner
    # @player_x = player_x
    # @player_o = player_o 
  end

  def play
    open_file
    check_rows_for_winner
    check_columns_for_winner
  end

  private

  def open_file
    File.open(file, "r")
    IO.foreach(file) do |line| 
      rows << line.chomp.split("")  #adds each stripped line to the rows array
    end
  end

  def check_rows_for_winner
    rows.each do |row|
      if row.count(X_MARKER) == 3
        @winner = player_x
      elsif row.count(O_MARKER) == 3
          @winner = player_o
      else
        @winner = "No winner"
      end
    end

    def check_columns_for_winner
      row.transpose
      check_rows_for_winner
    end

    def check_diaganol_for_winner
    end

    def display_winner
      puts "#{@winner} is the winner!"
    end
  end
end
file = "board"
tictactoe = TicTacToe.new(file)
tictactoe.play