
load "Grid.rb"

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
		@grid.randomGrid()
		puts @grid
	end

	##
	# Fills the current grid with picture's values
	def genPictureGrid(path)
		@grid.picture(path)
	end
end
