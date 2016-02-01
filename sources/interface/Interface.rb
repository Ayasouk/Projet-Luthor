
require "gtk2"

load "interface/HomeScreen.rb"
load "interface/MainWindow.rb"

##
# Classe purement fonctionnelle servant uniquement à lancer l'interface.
#
class Interface

	private_class_method :new

	def self.start()
		Gtk.init()
		window = MainWindow.new()
		window.setScreen(HomeScreen.new(window))
		Gtk.main()
		return nil
	end
end
