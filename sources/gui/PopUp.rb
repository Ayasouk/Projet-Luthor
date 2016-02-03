# encoding: utf-8

require "gtk2"
include Gtk

##
# Abstract class which preconfigure a Window to be a like a pop-up.
class PopUp < Window

	##
	# Preconfigure the Window to be like a pop-up.
	def initialize(window)
		super()
		self.transient_for = window
		self.keep_above = true
		self.resizable = false
		self.modal = true
	end
end
