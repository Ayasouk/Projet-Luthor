# encoding: utf-8

require "gtk2"
include Gtk

load "gui/GameScreen.rb"

##
# The screen displayed at the startup.
class StartScreen < VBox

	##
	# Make the start screen.
	def initialize(window)
		super()
		newGameButton = Button.new()
		self.add(newGameButton)
		newGameButton.label = "Nouvelle partie"
		newGameButton.signal_connect("clicked"){window.screen = GameScreen.new(window)}
	end
end
