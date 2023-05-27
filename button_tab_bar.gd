@tool
extends HBoxContainer

signal new_selected
@onready var children : Array = get_children()
@onready var childrenNumber: int = (children.size() - 1)
@export var selected : int = 0:
	set(value):
		selected = value
		if selected <= 0 or selected > childrenNumber: selected = clampi(selected, 0, childrenNumber)
@onready var buttongroup : ButtonGroup = ButtonGroup.new()

func _ready():
	print(childrenNumber)
	for c in children:
		c.button_group = buttongroup
		c.connect("pressed", _on_Button_pressed.bind(c))

func _on_Button_pressed(which : Button):
	selected = children.find(which)
	emit_signal("new_selected")
