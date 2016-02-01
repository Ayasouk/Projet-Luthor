
require "gtk2"
include Gtk

load "interface/GameScreen.rb"

class HomeScreen < VBox

	##
	# Initialise l'affichage du menu d'acceuil.
	#
	def initialize(window)
		super()
		@window = window
		startButton = Button.new()
		self.add(startButton)
		startButton.set_label("Lancer")
		startButton.signal_connect("clicked"){@window.setScreen(GameScreen.new(window))}
	end
end
