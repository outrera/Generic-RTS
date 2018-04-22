extends Spatial

const RAY_DISTANCE = 100
const CAMERASPEED = 10.0

var camera

var dir = Vector3()

export(float,-5.0,60.0)var water_main_height = -5.0
export(Color) var water_color = Color("698fc1e2")
export(Vector3) var sun_rotation = Vector3(-137,0,0)

func _ready():
	camera = get_viewport().get_camera()
	get_node("water").translation.y = water_main_height
#	get_node("water").get_surface_material(0).set_shader_param("albedo",water_color)
	get_node("sun").rotation = sun_rotation
	pass

func _process(delta):
	_camera(delta)


func _camera(delta):
	var old_t = camera.get_translation()
	if Input.is_key_pressed(KEY_UP):
		dir -= Vector3(0,0,1)
		pass
	if Input.is_key_pressed(KEY_DOWN):
		dir += Vector3(0,0,1)
		pass
	if Input.is_key_pressed(KEY_LEFT):
		dir -= Vector3(1,0,0)
		pass
	if Input.is_key_pressed(KEY_RIGHT):
		dir += Vector3(1,0,0)
		pass
	
	camera.set_translation(old_t + dir * CAMERASPEED)
	pass

