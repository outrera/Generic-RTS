extends Node

const CAMERASPEED = 0.5
const MOUSE_SENSITIVITY_SCROLL_WHEEL = 0.02
const MAX_ZOOM_DIRECTION = 30.2

var dir = Vector3()

var mouse_scroll_value = 0

export (String) var player_name = ""
export (Color) var player_color
export (int,0,8) var player_number = 1
export (int,0,8) var team = 1

var camera = null
var building_mode = false
var player_buildings = null
var player_units = null

func _ready():
	set_process_input(true)
	match player_number:
		0:
			pass
		1:
			_player_objects()
			camera = get_viewport().get_camera()
			pass
		2:
			camera = get_parent().get_parent().get_node("cam_2")
			_player_objects()
			pass
		3:
			camera = get_parent().get_parent().get_node("cam_3")
			_player_objects()
			pass
		4:
			camera = get_parent().get_parent().get_node("cam_4")
			_player_objects()
			pass
		5:
			camera = get_parent().get_parent().get_node("cam_5")
			_player_objects()
			pass
		6:
			camera = get_parent().get_parent().get_node("cam_6")
			_player_objects()
			pass
		7:
			camera = get_parent().get_parent().get_node("cam_7")
			_player_objects()
			pass
		8:
			camera = get_parent().get_parent().get_node("cam_8")
			_player_objects()
			pass
	pass


func _input(event):
	_camera(event)


func _player_objects():
	player_buildings = get_parent().get_parent().get_node("./Structures/Players/player_"+str(player_number))
	player_units = get_parent().get_parent().get_node("./Units/Players/player_"+str(player_number))
	pass

func _camera(e):
	if e.is_action_pressed("camera_move_up"):
		dir.z += 1
		pass
	if e.is_action_pressed("camera_move_down"):
		dir.z -= 1
		pass
	if e.is_action_pressed("camera_move_left"):
		dir.x += 1
		pass
	if e.is_action_pressed("camera_move_right"):
		dir.x -= 1
		pass
	
	camera.transform.basis = camera.transform.basis + dir * CAMERASPEED
	pass