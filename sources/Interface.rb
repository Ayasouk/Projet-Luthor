
require "gtk2"

load "MainWindow.rb"

class Interface

	private_class_method :new

	def self.start()
		Gtk.init()
		window = MainWindow.new()
		Gtk.main()
	end
end