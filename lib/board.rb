class Board

	attr_accessor :cells
  
	def initialize
    	reset!
  	end
  
	def reset!
    	@cells = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
	end
  
	def display
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
   		puts "-----------"
    	puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    	puts "-----------"
    	puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end
	
	def position(input)
		input.to_i
		cells[input-1]
	end
    
	def full?
		@cells.all? {|input| input == "X" ||  input == "O"}
	end
	
	def turn_count
		@cells.count {|input| input == "X" || input == "O"}
	end
	
	def position_taken?(input)
		position(input) == "X" || position(input) == "O"
	end
	
	def valid?(input)
		input = input.to_i
		!position_taken?(input) && input.between?(1,9)
	end
	
	def update(input, player)
		input = input.to_i
		cells[input-1] = player.symbol
	end
		
end