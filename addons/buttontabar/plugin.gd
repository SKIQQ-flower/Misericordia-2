@tool
extends EditorPlugin

var editor = get_editor_interface().get_base_control()

func _enter_tree():
	# Initialization of the plugin goes here.
	# Add the new type with a name, a parent type, a script and an icon.
	add_custom_type("ButtonTabBar", "Container", preload("res://addons/buttontabar/button_tab_bar.gd"), editor.get_theme_icon("TabBar", "EditorIcons"))


func _exit_tree():
	# Clean-up of the plugin goes here.
	# Always remember to remove it from the engine when deactivated.
	remove_custom_type("ButtonTabBar")
