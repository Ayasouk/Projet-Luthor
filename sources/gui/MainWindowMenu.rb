# encoding: utf-8

require "gtk2"
include Gtk

load "gui/AboutPopUp.rb"

##
# The menu of the main window.
class MainWindowMenu < MenuBar

	##
	# Make the menu.
	def initialize(window)
		super()

		fileMenuButton = MenuItem.new("Fichier")
		self.append(fileMenuButton)
		fileMenu = Menu.new()
		fileMenuButton.set_submenu(fileMenu)
		closeButton = MenuItem.new("Fermer")
		fileMenu.append(closeButton)
		closeButton.signal_connect("activate"){Gtk.main_quit()}

		otherMenuButton = MenuItem.new("Autres")
		self.append(otherMenuButton)
		otherMenu = Menu.new()
		otherMenuButton.set_submenu(otherMenu)
		aboutButton = MenuItem.new("À propos")
		otherMenu.append(aboutButton)
		aboutButton.signal_connect("activate"){AboutPopUp.new(window)}
	end
end
