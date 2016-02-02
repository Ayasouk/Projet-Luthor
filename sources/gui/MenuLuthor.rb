# encoding: utf-8

require "gtk2"
include Gtk

##
# Menu de la fenêtre de l'application.
class MenuLuthor < MenuBar

	##
	# Initialise le menu.
	def initialize()
		super()

		menuFichier = MenuItem.new("Fichier")
		self.append(menuFichier)
		menuDeroulantFichier = Menu.new()
		menuFichier.set_submenu(menuDeroulantFichier)
		boutonFermer = MenuItem.new("Fermer")
		menuDeroulantFichier.append(boutonFermer)
		boutonFermer.signal_connect("activate"){Gtk.main_quit()}

		menuAutres = MenuItem.new("Autres")
		self.append(menuAutres)
		menuDeroulantAutres = Menu.new()
		menuAutres.set_submenu(menuDeroulantAutres)
		boutonPropos = MenuItem.new("À propos")
		menuDeroulantAutres.append(boutonPropos)
	end
end
