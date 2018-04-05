extends Spatial

var ray = 1000

var objects = [preload("res://Scene/WorldObjects/test/House1.scn")]
var currentObject = null

func _ready():
	set_process_input(true)
	set_physics_process(true)
	pass

func _physics_process(delta):
	var m = get_viewport().get_mouse_position()
	if Input.is_class("InputEventMouseMotion"):
		var from = get_viewport().get_camera().project_ray_origin(m)
		var to = from + get_viewport().get_camera().project_ray_normal(m)*ray
		var space = get_viewport().get_camera().get_world().direct_space_state.intersect_ray(from,to)
		if space.has("position"):
			currentObject.translation.x = space.position.x
			currentObject.translation.z = space.position.y
			print(currentObject.translation.x)
			print(currentObject.translation.z)
	pass


func _input(event):
	
	if Input.is_key_pressed(KEY_H):
		var new_object = objects[0].instance()
		currentObject = new_object
		add_child(currentObject)