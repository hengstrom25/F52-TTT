class Game

	attr_accessor :board, :player_1, :player_2
	
	WINNING = [
		[0,1,2],
		[3,4,5],
		[6,7,8],
		[0,4,8],
		[2,4,6],
		[0,3,6],
		[1,4,7],
		[2,5,8],	
	]
	
	def initialize(player_1 = Player.new("X"), player_2 = Player.new("O"), board=Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end
	
	def current_player
		board.turn_count.even? ? player_1 : player_2
	end
	
	def game_won?
		WINNING.find do |combo|
      		board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
		end
	end
	
	def game_tied?
		if !game_won? && board.full?
			return true
		end
	end
	
	def game_over?
		if game_won? || game_tied? || board.full?
			return true
		end
	end
	
	def winner
		if game_won?
			return board.cells[game_won?[0]]
		end
	end
	
	def turn
		board.display
		input = current_player.move(board)
		if board.valid?(input)
			board.update(input, current_player)
		else
			turn
		end
	end
	
	def play
		until game_over?
		turn
		end
		if winner
			board.display
			puts "#{winner} is the winner!"
		else
			puts "Tied!"
		end
	end
	
end