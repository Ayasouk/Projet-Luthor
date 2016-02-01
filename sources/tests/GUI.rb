require "gtk2"
require "rmagick"
include Magick

Gtk.init

image2 = ImageList.new("pichu.png")
#image2 = image2.charcoal(radius=5.00, sigma = 0.001)

image2 = image2.threshold(255)
#image2 = image2.quantize(number_colors = 2, colorspace = GRAYColorspace)
#image2 = image2.edge(radius = 2.0)
image2 = image2.negate(grayscale = false)
image2 = image2.resize(0.25)


image2.write("image.bmp")

image = Gtk::Image.new("image.bmp")

window = Gtk::Window.new
window.set_title('GTK - Picross')
window.signal_connect('destroy') { Gtk.main_quit }

vb = Gtk::VBox.new

vb.pack_start(image)
#vb.pack_start(image2)

ok = Gtk::Button.new(Gtk::Stock::CLOSE)
ok.signal_connect('clicked') { Gtk.main_quit }

vb.pack_start(ok)

window.add(vb)
window.show_all

Gtk.main

lol = """Engine:
	methods:
		- changeCellState (return Boolean or None)
		- getGrid (return Grid)
		- saveGrid (return Boolean or None)
		- setGrid (return Boolean or None)
		- cleanGrid (return Boolean or None)

	content:
		Grid = Matrix::Grid
		GridGenerator = Object

Grid:
	content:
		Grid = Matrix::Grid(Cell)
	methods:
		- changeCellState (return Boolean or None)
		- getLength (return int)
		- setGrid (return Boolean or None)

Cell:
	content:
		state = Boolean
		value = Boolean
	methods:
		- setState (return Boolean or None)
		- setValue (return Boolean or None)
		- getState (return Boolean)
		- getValue (return Boolean)
"""
