extends StaticBody

export (String) var structure_name = "Building"
export (String) var cultural_name = "Edificio"

onready var mesh = get_node("mesh")
onready var spawn_point = get_node("spawn_point")
onready var object_sound = get_node("object_sound")

var is_selected = false



func _process(delta):
	if is_selected:
		print("selected")
	else:
		return 