# encoding: utf-8

require "gtk2"
include Gtk

load "gui/MenuLuthor.rb"

##
# Représente la fenêtre principale de l'application
class FenetreLuthor < Window

	##
	# Initialise la fenêtre avec aucun écran.
	def initialize()
		super()
		self.window_position = Window::POS_CENTER
		self.set_title("Luthor Picross")
		self.signal_connect("destroy"){Gtk.main_quit()}
		@box = VBox.new()
		self.add(@box)

		@menu = MenuLuthor.new()
		@box.pack_start(@menu, false, true, 0)
	end

	##
	# Change l'écran de la fenêtre.
	#
	def ecran=(ecran)
		@box.remove(@ecran) if @ecran != nil
		@ecran = ecran
		@box.add(@ecran)
		self.show_all()
		return self
	end
end
