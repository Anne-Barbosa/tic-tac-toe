# frozen_string_literal: true

require_relative '../tic_tac_toe'

describe TicTacToe::Board do
  describe '#initialize' do
    it 'creates a grid with 10 elements (ignoring index 0)' do
      board = TicTacToe::Board.new
      expect(board.grid.length).to eq(10)
    end
  end
end

describe TicTacToe::Player do
  let(:player) { TicTacToe::Player.new('Alice', 'X') }

  it 'has a name and a marker' do
    expect(player.name).to eq('Alice')
    expect(player.marker).to eq('X')
  end
end

describe TicTacToe::Game do
  let(:player_x) { TicTacToe::Player.new('Player 1', 'X') }

  describe '#player_has_won?' do
    it 'returns true when the top row (1, 2, 3) is all X' do
      allow_any_instance_of(TicTacToe::Game).to receive(:puts)
      
      game = TicTacToe::Game.new
      game.instance_variable_get(:@board).grid[1] = 'X'
      game.instance_variable_get(:@board).grid[2] = 'X'
      game.instance_variable_get(:@board).grid[3] = 'X'

      expect(game.send(:player_has_won?, player_x)).to be true
    end

    it 'returns false when there is no winning line' do
      allow_any_instance_of(TicTacToe::Game).to receive(:puts)

      game = TicTacToe::Game.new
      game.instance_variable_get(:@board).grid[1] = 'X'
      game.instance_variable_get(:@board).grid[2] = 'O'
      game.instance_variable_get(:@board).grid[3] = 'X'

      expect(game.send(:player_has_won?, player_x)).to be false
    end
  end

  describe 'turn and move execution using doubles' do
    it 'places the marker on the board using a mocked player input' do
      allow_any_instance_of(TicTacToe::Game).to receive(:puts)

      game = TicTacToe::Game.new
      
      mock_player = double('Player', name: 'Bot', marker: 'X', to_s: 'Bot')
      allow(mock_player).to receive(:select_position!).and_return(5)

      board = game.instance_variable_get(:@board)
      position = mock_player.select_position!(board)
      board.grid[position] = mock_player.marker

      expect(board.grid[5]).to eq('X')
    end
  end
end

