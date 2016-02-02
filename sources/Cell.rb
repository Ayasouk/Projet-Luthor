
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
