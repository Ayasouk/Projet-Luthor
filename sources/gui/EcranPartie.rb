# encoding: utf-8

require "gtk2"
include Gtk

load "core/Game.rb"

##
# Écran de la partie en cours.
class EcranPartie < Table

	##
	# Initialise l'affichage de la partie.
	def initialize(fenetre)
		# Code trop dépendant de la structure interne de la partie génération
		partie = Game.new()
		partie.start()
		grille = partie.engine.grid
		#
		super(grille.maxLen, grille.maxLen)
		grille.matrix.each_with_index { |ligne, ligneIndex|
			ligne.each_with_index { |cas, caseIndex|
				self.attach_defaults(Button.new(cas.value ? "X" : ""), caseIndex, caseIndex + 1, ligneIndex, ligneIndex + 1)
			}
		}
	end
end
