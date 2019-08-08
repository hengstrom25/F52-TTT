class Player
	
	attr_accessor :symbol
	
	def initialize(symbol)
		@symbol = symbol
	end
	
	def move(board)
		puts "Please enter the number of the cell you would like (1-9) and then enter"
		gets.chomp
	end
	
end