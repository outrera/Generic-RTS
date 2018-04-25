extends Node

const CAMERASPEED = 0.5
const MOUSE_SENSITIVITY_SCROLL_WHEEL = 0.02
const MAX_ZOOM_DIRECTION = 30.2

var dir = Vector3()

var mouse_scroll_value = 0

const MAX_POPULATION = 300

export (String) var player_name = ""
export (Color) var player_color
export (int,0,8) var player_number = 1
export (int,0,8) var team = 1
export (String,FILE) var civilization_data = null
export (int,0,99999999) var food = 500
export (int,0,99999999) var wood = 500
export (int,0,99999999) var stone = 500
export (int,0,99999999) var metals = 500
export (int,0,99999999) var coins = 500
export (int,0,99999999) var population = 0

var current_population = 0

var camera = null
var building_mode = false
var player_pos = Vector3()
var camera_pos = Vector3()

onready var root = get_parent().get_parent().get_node("ui/ui/game_panel/box")

func _ready():
	set_process_input(true)
	match player_number:
		0:
			pass
		1:
			_player_objects()
			camera = get_viewport().get_camera()
			
			root.get_node("food").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/food_icon.png[/img] : " + str(food)
			root.get_node("wood").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/wood_icon.png[/img] : " + str(wood)
			root.get_node("stone").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/stone_icon.png[/img] : " + str(stone)
			root.get_node("metals").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/metal_icon.png[/img] : " + str(metals)
			root.get_node("coins").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/gold_icon.png[/img] : " + str(coins)
			root.get_node("popuation").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/population_icon.png[/img] : " + str(population) +"/"+str(MAX_POPULATION)
			pass
		2:
			camera = get_parent().get_parent().get_node("cam2")
			_player_objects()
			pass
		3:
			camera = get_parent().get_parent().get_node("cam3")
			_player_objects()
			pass
		4:
			camera = get_parent().get_parent().get_node("cam4")
			_player_objects()
			pass
		5:
			camera = get_parent().get_parent().get_node("cam5")
			_player_objects()
			pass
		6:
			camera = get_parent().get_parent().get_node("cam6")
			_player_objects()
			pass
		7:
			camera = get_parent().get_parent().get_node("cam7")
			_player_objects()
			pass
		8:
			camera = get_parent().get_parent().get_node("cam8")
			_player_objects()
			pass
	pass


func _process(delta):
	food += 1
	wood += 1
	stone += 1
	metals += 1
	coins += 1
	root.get_node("food").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/food_icon.png[/img] : " + str(food)
	root.get_node("wood").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/wood_icon.png[/img] : " + str(wood)
	root.get_node("stone").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/stone_icon.png[/img] : " + str(stone)
	root.get_node("metals").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/metal_icon.png[/img] : " + str(metals)
	root.get_node("coins").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/gold_icon.png[/img] : " + str(coins)
	root.get_node("popuation").bbcode_text = "[img]res://GameObjects/GUI/globals/icons/population_icon.png[/img] : " + str(population) +"/"+str(current_population)
	pass

func _input(event):
	_camera(event)


func _player_objects():
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
	
	#camera.transform.basis = camera.transform.basis + dir * CAMERASPEED
	pass