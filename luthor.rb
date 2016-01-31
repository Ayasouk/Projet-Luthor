gem "rmagick"
gem "rdoc"
require "rmagick"
require "rdoc/rdoc"
include Magick
##
# This class represents the complete +Game+
class Game
	# Debugging accessor
	attr_accessor :engine

	##
	# Creates a new instance of the game
	def initialize()
		@engine = Engine.new
	end

	##
	# Starts the engine
	def start()
		@engine.genRandomGrid()
	end
end
##
# This class represents the +Controller+ from +MVC+
class Engine
	# Debugging accessor
	attr_accessor :grid

	##
	# Initiates the needed instance's variables
	def initialize(x = 10)
		@grid = Grid.new(x)
	end

	##
	# Generates a x * x grid of +Cell+ with false value/state
	def genNewGrid(x = 10)
		@grid = Grid.new(x)
	end

	##
	# Fills the current grid with random value
	def genRandomGrid()
		@grid = @grid.random()
	end

	##
	# Fills the current grid with picture's values
	def genPictureGrid(path)
		@grid = @grid.picture(path)
	end
end

##
# This class represents a +Grid+
class Grid 
	# Debugging accessor
	attr_accessor :maxLen #Longueur/Largeur
	# Debugging accessor
	attr_accessor :grid #2 listes. Voir object Cell
	# Debugging accessor
	attr_accessor :xIndices #Les indices au dessus des abscisses 
	# Debugging accessor
	attr_accessor :yIndices #Les indices à gauche des ordonnées

	##
	# Initializes +@grid+, +@xIndices+ and +@yIndices+ with 2D Array
	def initialize(x = 10)
		@maxLen = x
		@grid = Array.new(x){Array.new(x){Cell.new(false, false)}}
		@xIndices = Array.new(x){Array.new}
		@yIndices = Array.new(x){Array.new}
	end

	##
	# Turns to false a true cell state and to true a false cell state
	def changeCellState(x, y)
		@grid[x][y].changeState
	end

	##
	# Returns the @maxLen if needed
	def getLength()
		return @maxLen
	end

	##
	# Generates "randomly" the value of each grid's cell
	def random()
		for i in 0..@maxLen-1
			for j in 0..@maxLen-1
				rand_value = Random.srand(Random.new_seed)
				if ( rand_value % 2) == 0
					value = true
				else
					value = false
				end
				@grid[i][j].setValue(value)
			end
		end
		evalIndices()
		p @grid
	end

	##
	# TODO : Generates a grid from a picture
	def picture()

	end

	##
	# Fills +@xIndices+ and +@yIndices+ with right values
	def evalIndices()
		for i in 0..@maxLen-1
			_in = false
			_nb = 0
			for j in 0..@maxLen-1
				if @grid[i][j].getValue 
					_in = true
					_nb += 1
				elsif _in
					@xIndices[i].push(_nb)
					_in = false
					_nb = 0
				end
			end
			if _in
				@xIndices[i].push(_nb)
				_in = false
				_nb = 0
			end
		end

		for j in 0..@maxLen-1
			_in = false
			_nb = 0
			for i in 0..@maxLen-1
				if @grid[i][j].getValue 
					_in = true
					_nb += 1
				elsif _in
					@yIndices[j].push(_nb)
					_in = false
					_nb = 0
				end
			end
			if _in
				@yIndices[j].push(_nb)
				_in = false
				_nb = 0
			end
		end
	end
end


##
#  This class represents a +Cell+
class Cell
	# Debugging accessor
	attr_accessor :state #Etat graphique (GUI)
	# Debugging accessor
	attr_accessor :value #Valeur réelle (MOTEUR)

	##
	# Initializes the +@state+ and +@value+ with parameters
	def initialize(state, value)
		@state = state
		@value = value
	end

	##
	# Makes the +Cell+ object printable
	def to_s
		if @value
			return "[X]"
		else
			return "[ ]"
		end
	end

	##
	# Boolean access method
	def changeState()
		if @state == true
			@state = false
		else
			@state = true
		end
	end

	##
	# Access method
	def setValue(value)
		@value = value
	end

	##
	# Access method
	def getState()
		return @state
	end

	##
	# Access method
	def getValue()
		return @value
	end

	##
	# Verifies if +@state+ and +@value+ are the same
	def right?
		return @state && @value
	end
end

# Main program

game = Game.new
game.start()




