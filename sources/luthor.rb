# encoding: utf-8

# Main script.
# The differents components that need to be launched at startup are started here.
# The GUI must be the last component started.

load "gui/MainWindow.rb"

# GUI
Gtk.init()
MainWindow.new()
Gtk.main()
