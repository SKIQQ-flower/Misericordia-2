extends Control

var images = []
var dir = DirAccess.open("res://Mascotes/")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and not file.ends_with(".import"):
			images.append("res://" + "Mascotes/" + file)

	dir.list_dir_end()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func random_image():
	var image = images[randi() % images.size()]
	if load(image) == %misericordia.texture: image = images[randi() % images.size()]
	return image

func _on_texture_rect_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		var image = random_image()
		var tween = create_tween().set_parallel(true)
		var filename = "[center]" + image.get_basename().replace("res://Mascotes/", "") + "[/center]"
		image = load(image)
		tween.tween_property(%misericordia, "custom_minimum_size", Vector2(550, 0), 0.2).set_ease(Tween.EASE_IN_OUT)
		tween.chain().tween_property(%misericordia, "custom_minimum_size", Vector2(600, 0), 0.2)
		await tween.step_finished
		%misericordia.texture = image
		##
		%nome.text = filename


func _on_h_box_container_new_selected():
	print($HBoxContainer.selected)
