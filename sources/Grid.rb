
load "Array.rb"
load "Cell.rb"

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
