
require "gtk2"

load "MainWindow.rb"

##
# Classe purement fonctionnelle servant uniquement à lancer l'interface.
#
class Interface

	private_class_method :new

	def self.start()
		Gtk.init()
		window = MainWindow.new()
		Gtk.main()
		return nil
	end
end
