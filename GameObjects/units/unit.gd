extends KinematicBody

const SPEED = 0.05

enum states {IDLE,FOLLOW}
var state = null

var path = []
var target_point_world = Vector3()
var target_position = Vector3()

var velocity = Vector3()

var player_owner = 0
var selected = false

export(String) var unit_name = "Unit"
export(String) var culture_name = "Unit"
export(int,0,99999) var hp = 10
export(int,0,4) var unit_type = 0

#command data:
export(String,FILE) var unit_data = null

onready var grid = get_parent().get_parent().get_parent()
onready var ui = grid.get_parent().get_parent().get_node("ui/panel_player/right/commands")

onready var select_square = $select_square
onready var hp_bar = $hp_bar
onready var anim = $anim

func _ready():
	_change_state(IDLE)

func _change_state(new_state):
	if new_state == FOLLOW:
		path = get_node("/root/Astar").get_path(grid,translation,target_position)
	if not path:
		_change_state(IDLE)
		return
	target_point_world = path[0]
	_state = new_state

func _process(delta):
	if not state == FOLLOW:
		return
	var arrived_to_next_point = move_to(target_point_world)
	if arrived_to_next_point:
		path.remove(0)
		if len(path) == 0:
			_change_state(IDLE)
			return
		target_point_world = path[0]

func move_to(world_position):
	var MASS = 10.0
	var ARRIVE_DISTANCE = 10.0
	var desired_velocity = (world_position - translation).normalized() * SPEED
	var steering = desired_velocity - velocity
	velocity += steering / MASS
	translation += velocity * get_process_delta_time()
	rotation = velocity.angle_to(translation.y)
	return translation.distance_to(world_position) < ARRIVE_DISTANCE

func _on_unit_input_event(camera, event, click_position, click_normal, shape_idx):
	if event.is_action_pressed("click_left"):
		print("select: " + str(select))
		if select == true:
			ui.type = unit_type
			ui.commands_data = unit_data
			select = false
			select_square.hide()
		else:
			ui.type = 0
			ui.commands_data = null
			select = true
			select_square.show()

func _on_unit_mouse_enter():
	hp_bar.hide()
	pass

func _on_test_mouse_exited():
	hp_bar.show()
	pass

