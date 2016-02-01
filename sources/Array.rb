
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
