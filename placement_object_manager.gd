extends Spatial

var ray = 1000

var objects = []
onready var currentObject = get_node("object")

func _ready():
	set_process_input(true)
	set_physics_process(true)
	pass

func _physics_process(delta):
	pass

func _input(event):
	objectAtMouse(event)

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
				print(hit.collider)
				currentObject.translation.x = hit.position.x
				currentObject.translation.y = hit.normal.y
				currentObject.translation.z = hit.position.z
				print(currentObject.translation.z)
