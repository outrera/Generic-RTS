extends Spatial


const CAMERASPEED = 0.5
const MOUSE_SENSITIVITY_SCROLL_WHEEL = 0.02
const MAX_ZOOM_DIRECTION = 30.2

var dir = Vector3()

var mouse_scroll_value = 0

onready var camera = get_viewport().get_camera()

func _ready():
	set_translation(Vector3(0,10,0))
	#set_process_input(true)
	set_process(true)

func _process(delta):
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
	
	camera.set_translation(get_translation() + dir * CAMERASPEED)
	pass
