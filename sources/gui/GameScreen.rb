# encoding: utf-8

require "gtk2"
include Gtk

load "core/Game.rb"

##
# Screen that display the pending game.
class GameScreen < Table

	##
	# Make the screen.
	def initialize(window)
		game = Game.new()
		game.start()
		grid = game.engine.grid

		super(grid.maxLen, grid.maxLen)
		grid.matrix.each_with_index { |row, rowIndex|
			row.each_with_index { |cell, cellIndex|
				self.attach_defaults(Button.new(cell.value ? "X" : ""), cellIndex, cellIndex + 1, rowIndex, rowIndex + 1)
			}
		}
	end
end
