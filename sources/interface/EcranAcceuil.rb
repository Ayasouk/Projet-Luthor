
require "gtk2"
include Gtk

load "interface/EcranPartie.rb"

##
# Écran d'acceuil
class EcranAcceuil < VBox

	##
	# Initialise l'affichage du menu d'acceuil.
	def initialize(fenetre)
		super()
		lancerBtn = Button.new()
		self.add(lancerBtn)
		lancerBtn.set_label("Lancer")
		lancerBtn.signal_connect("clicked"){fenetre.ecran = EcranPartie.new(fenetre)}
	end
end
