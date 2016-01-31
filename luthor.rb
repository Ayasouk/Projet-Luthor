gem "rmagick"
gem "rdoc"
require "rmagick"
require "rdoc/rdoc"
include Magick

##
# This class is already existing but allow us the add a safe_transpose method
class Array

	##
	# .transpose method without same length requirements
	def safe_transpose
		result = []
		max_size = self.max { |a,b| a.size <=> b.size }.size
		max_size.times do |i|
			result[i] = Array.new(self.first.size)
			self.each_with_index { |r,j| result[i][j] = r[i] }
		end
		result
	end
end

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
		@grid.randomGrid()
		puts @grid
	end

	##
	# Fills the current grid with picture's values
	def genPictureGrid(path)
		@grid.picture(path)
	end
end

##
# This class represents a +Grid+
class Grid 
	# Debugging accessor
	attr_accessor :maxLen #Longueur/Largeur
	# Debugging accessor
	attr_accessor :matrix #2 listes. Voir object Cell
	# Debugging accessor
	attr_accessor :xIndices #Les indices au dessus des abscisses 
	# Debugging accessor
	attr_accessor :yIndices #Les indices à gauche des ordonnées

	##
	# Initializes +@grid+, +@xIndices+ and +@yIndices+ with 2D Array
	def initialize(x = 10)
		@maxLen = x
		@matrix = Array.new(x){Array.new(x){Cell.new(false, false)}}
		@xIndices = Array.new(x){Array.new}
		@yIndices = Array.new(x){Array.new}
	end

	##
	#
	def printIndices()

	end
	##
	# Turns to false a true cell state and to true a false cell state
	def changeCellState(x, y)
		@matrix[x][y].changeState
	end

	##
	# Returns the @maxLen if needed
	def getLength()
		return @maxLen
	end

	##
	# Generates "randomly" the value of each grid's cell
	def randomGrid()
		@matrix.each do |j|
			j.each do |x|
				rand_value = Random.srand(Random.new_seed)
				if ( rand_value % 2) == 0
					x.setValue(true)
				else
					x.setValue(false)
				end
			end
		end
		evalIndices()
		# NB : Class is Array
		p @xIndices
		p @yIndices
	end

	##
	# TODO : Generates a grid from a picture
	def picture()

	end

	##
	# Fills +@xIndices+ and +@yIndices+ with right values
	def evalIndices()
		_row = 0
		_in = false
		_nb = 0
		@matrix.each do |j|
			_in = false
			_nb = 0
			j.each do |x|
				if x.getValue
					_in = true
					_nb += 1
				elsif _in
					@xIndices[_row].push(_nb)
					_in = false
					_nb = 0
				end
			end
			if _in
				@xIndices[_row].push(_nb)
				_in = false
				_nb = 0
			end
			_row += 1
		end
		temp = @matrix.safe_transpose
		_row = 0
		temp.each do |i|
			_in = false
			_nb = 0
			i.each do |x|
				if x.getValue
					_in = true
					_nb += 1
				elsif _in
					@yIndices[_row].push(_nb)
					_in = false
					_nb = 0
				end
			end
			if _in
				@yIndices[_row].push(_nb)
				_in = false
				_nb = 0
			end
			_row += 1
		end
	end

	def to_s
		ret = ""
		@matrix.each do |j|
			j.each do |cell|
				ret += cell.to_s
			end
			ret += "\n"
		end
		return ret
	end

	def inspect
		ret = ""
		@matrix.each do |j|
			j.each do |cell|
				ret += cell.to_s
			end
			ret += "\n"
		end
		return ret
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
			"[X]"
		else
			"[ ]"
		end
	end

	def inspect
		if @value
			"[X]"
		else
			"[ ]"
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


game = Game.new
game.start()




