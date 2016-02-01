
require "gtk2"
include Gtk

load "Game.rb"

##
# Représente la fenêtre principale de l'application
#
class MainWindow < Window

	##
	# Initialise la fenêtre avec aucun écran.
	#
	def initialize()
		super()
		self.window_position = Window::POS_CENTER
		self.set_title("Luthor Picross")
		self.signal_connect("destroy"){Gtk.main_quit()}

		@box = VBox.new()
		self.add(@box)

		@bar = MenuBar.new()
		@box.add(@bar)
		fileMenu = Menu.new()
		fileMenuButton = MenuItem.new("Fichier")
		@bar.append(fileMenuButton)
		fileMenuButton.set_submenu(fileMenu)
		exitButton = MenuItem.new("Fermer")
		fileMenu.append(exitButton)
		exitButton.signal_connect("activate"){Gtk.main_quit()}
	end

	##
	# Change l'écran de la fenêtre.
	#
	def setScreen(screen)
		for child in @box
			@box.remove(child) if child != @bar
		end
		@box.add(screen)
		self.show_all()
		return self
	end
end
