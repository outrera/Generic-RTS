extends Spatial

var ray = 1000

var objects = []
var meshes = []
onready var currentObject = get_node("object")

func _ready():
	set_process_input(true)
	pass

func _input(event):
	objectAtMouse(event)
	placeObjectAtPos(event)
	setMesh(event)
	pass

#for some reason only can move in input process but no in physic process
func objectAtMouse(event):
	if event.is_class("InputEventMouseMotion"):
		var from = get_viewport().get_camera().project_ray_origin(get_viewport().get_mouse_position())
		var ray_direction = get_viewport().get_camera().project_ray_normal(get_viewport().get_mouse_position())
		var to = from + ray_direction*ray
		var space = get_viewport().get_camera().get_world().direct_space_state
		var hit = space.intersect_ray(from,to)
		
		if hit.has("position"):
			if hit.size() != 0:
				#currentObject.move_and_slide(Vector3(hit.position.x,0,hit.position.z),Vector3(0,hit.normal.y,0))
				currentObject.translation.x = hit.position.x
				currentObject.translation.y = hit.normal.y
				currentObject.translation.z = hit.position.z


func placeObjectAtPos(event):
	if event.is_class("InputEventMouseButton") and event.button_index == BUTTON_LEFT and event.pressed():
		pass
	pass

func setMesh(event):
	
	pass