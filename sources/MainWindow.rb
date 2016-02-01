
require "gtk2"
include Gtk

load "Game.rb"

class MainWindow < Window

	def initialize()
		super()
		self.window_position = Window::POS_CENTER
		self.set_title("Luthor Picross")
		self.signal_connect("destroy"){Gtk.main_quit()}

		main_menu()
	end

	private

	def clear_window()
		for child in self.children
			self.remove(child)
		end
	end

	def main_menu()
		clear_window()

		startButton = Button.new()
		self.add(startButton)
		startButton.set_label("Lancer")
		startButton.signal_connect("clicked"){grid()}

		self.show_all()
	end

	def grid()
		clear_window()

		# Code dépendant de la structure interne de la partie génération
		game = Game.new()
		game.start()
		grid = game.engine.grid
		#
		table = Table.new(grid.maxLen, grid.maxLen)
		self.add(table)
		grid.matrix.each_with_index { |row, rowIndex|
			row.each_with_index { |cell, cellIndex|
				button = Button.new(cell.value ? "X" : "")
				table.attach_defaults(button, cellIndex, cellIndex+1, rowIndex, rowIndex+1)
			}
		}
		

		self.show_all()
	end
end