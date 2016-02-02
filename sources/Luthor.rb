# encoding: utf-8

##
# Script principal.
# C'est ici que l'on démarre les différentes composantes de l'application qui doivent être initialisées au début.

load "gui/EcranAcceuil.rb"
load "gui/FenetreLuthor.rb"

# Lancement de l'interface
Gtk.init()
window = FenetreLuthor.new()
window.ecran = EcranAcceuil.new(window)
Gtk.main()
