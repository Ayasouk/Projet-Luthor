
require "gtk2"
include Gtk

load "Game.rb"

##
# Repr�sente la fen�tre principale de l'application
#
class MainWindow < Window

	##
	# Initialise la fen�tre et affiche le menu d'acceuil.
	#
	def initialize()
		super()
		self.window_position = Window::POS_CENTER
		self.set_title("Luthor Picross")
		self.signal_connect("destroy"){Gtk.main_quit()}

		main_menu()
	end

	private

	##
	# Vide la fen�tre.
	#
	def clear_window()
		for child in self.children
			self.remove(child)
		end
		return self
	end

	##
	# Affiche le menu d'acceuil.
	#
	def main_menu()
		clear_window()

		startButton = Button.new()
		self.add(startButton)
		startButton.set_label("Lancer")
		startButton.signal_connect("clicked"){grid()}

		self.show_all()
	end

	##
	# Affiche la partie.
	#
	def grid()
		clear_window()

		# Code d�pendant de la structure interne de la partie g�n�ration
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
