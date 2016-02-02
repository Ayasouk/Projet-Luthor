
require "gtk2"
include Gtk

load "Game.rb"

class GameScreen < Table

	##
	# Initialise l'affichage de la partie.
	#
	def initialize(window)
		# Code trop dépendant de la structure interne de la partie génération
		game = Game.new()
		game.start()
		grid = game.engine.grid
		#
		super(grid.maxLen, grid.maxLen)
		@window = window
		grid.matrix.each_with_index { |row, rowIndex|
			row.each_with_index { |cell, cellIndex|
				button = Button.new(cell.value ? "X" : "")
				self.attach_defaults(button, cellIndex, cellIndex+1, rowIndex, rowIndex+1)
			}
		}
	end
end
