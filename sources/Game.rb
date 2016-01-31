
load "Engine.rb"

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
