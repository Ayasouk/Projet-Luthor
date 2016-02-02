
require "gtk2"
include Gtk

##
# Menu de la fenêtre de l'application.
class LuthorMenu < MenuBar

	##
	# Initialise le menu.
	def initialize()
		super()

		fileMenuButton = MenuItem.new("Fichier")
		self.append(fileMenuButton)
		fileMenu = Menu.new()
		fileMenuButton.set_submenu(fileMenu)
		exitButton = MenuItem.new("Fermer")
		fileMenu.append(exitButton)
		exitButton.signal_connect("activate"){Gtk.main_quit()}

		otherMenuButton = MenuItem.new("Autres")
		self.append(otherMenuButton)
		otherMenu = Menu.new()
		otherMenuButton.set_submenu(otherMenu)
		aboutButton = MenuItem.new("À propos")
		otherMenu.append(aboutButton)
	end
end
