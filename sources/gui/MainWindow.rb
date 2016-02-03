# encoding: utf-8

require "gtk2"
include Gtk

load "gui/MainWindowMenu.rb"
load "gui/StartScreen.rb"

##
# The main window of the application.
# The main window is divided in two parts, the menu and the screen (a Widget).
# To change the display, it is just necessary to set the screen.
class MainWindow < Window

	##
	# Make the main window, with its menu and the start screen.
	def initialize()
		super()
		self.window_position = Window::POS_CENTER
		self.title = "Luthor Picross"
		self.signal_connect("destroy"){Gtk.main_quit()}
		@box = VBox.new()
		self.add(@box)

		@menu = MainWindowMenu.new(self)
		@box.pack_start(@menu, false, true, 0)

		self.show_all()

		self.screen = StartScreen.new(self)
	end

	##
	# Set the screen of the main window.
	# This will update the display.
	def screen=(screen)
		@box.remove(@screen) if @screen != nil
		@screen = screen
		@box.add(@screen)
		@screen.show_all()
		return self
	end
end
