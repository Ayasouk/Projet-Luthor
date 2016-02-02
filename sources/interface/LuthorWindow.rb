
require "gtk2"
include Gtk

load "interface/LuthorMenu.rb"

##
# Représente la fenêtre principale de l'application
#
class LuthorWindow < Window

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

		@menu = LuthorMenu.new()
		@box.pack_start(@menu, false, true, 0)
	end

	##
	# Change l'écran de la fenêtre.
	#
	def setScreen(screen)
		@box.remove(@screen) if @screen != nil
		@screen = screen
		@box.add(@screen)
		self.show_all()
		return self
	end
end
