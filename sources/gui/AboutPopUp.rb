# encoding: utf-8

require "gtk2"
include Gtk

load "gui/PopUp.rb"

##
# The 'About' window, showing credits and licence for instance.
class AboutPopUp < PopUp

	##
	# Make the window.
	def initialize(window)
		super(window)
		self.title = "Crédits"
		self.add(Label.new("Crédits"))
		self.show_all()
	end
end
