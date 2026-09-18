module TicTacToe
  LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], #lines
    [1, 4, 7], [2, 5, 8], [3, 6, 9], #rows
    [1, 5, 9], [3, 5, 7]             #diagonals
  ]

  class Board
    attr_reader :grid

    def initialize
      @grid = Array.new(10) # Ignore index 0
    end

    def print_board
      col_separator, row_separator = " | ", "--+---+--"
      label_for_position = lambda { |position| @grid[position] ? @grid[position] : position }
      row_for_display = lambda { |row| row.map(&label_for_position).join(col_separator) }
      row_positions = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      rows_for_display = row_positions.map(&row_for_display)
      puts "\n" + rows_for_display.join("\n" + row_separator + "\n") + "\n\n"
    end
  end

  class Player
    attr_reader :name, :marker

    def initialize(name, marker)
      @name = name
      @marker = marker
    end

    def select_position!(board)
      loop do
        print "#{name} (#{marker}), choose a position from 1 to 9: "
        position = gets.to_i
        
        if position.between?(1, 9) && board.grid[position].nil?
          return position
        else
          puts "Invalid move or occupied position. Try again."
        end
      end
    end

    def to_s
      @name
    end
  end

  class Game
    def initialize
      @board = Board.new
      @players = [
        Player.new("Player 1", "X"),
        Player.new("Player 2", "O")
      ]
      @current_player_id = 0
      puts "#{@players[@current_player_id]} starts the game!"
    end

    def play
      loop do
        @board.print_board
        
        # 1. Player choose a position
        position = current_player.select_position!(@board)
        @board.grid[position] = current_player.marker

        # 2. Check victory
        if player_has_won?(current_player)
          @board.print_board
          puts "#{current_player} wins"
          return
        elsif @board.grid[1..9].none?(&:nil?)
          @board.print_board
          puts "It's a draw"
          return
        end

        @current_player_id = 1 - @current_player_id
      end
    end

    private

    def current_player
      @players[@current_player_id]
    end

    def player_has_won?(player)
      LINES.any? do |line|
        line.all? { |position| @board.grid[position] == player.marker }
      end
    end
  end
end

# To run the game:
include TicTacToe
Game.new.play
