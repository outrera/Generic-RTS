extends Spatial

const SPEED = 20.0

var navigation = get_parent().get_parent().get_parent().get_node("navigation")

export(NodePath) var camera = null
export(PackedScene) var hat = null
export(PackedScene) var torso = null
export(PackedScene) var backpack = null
export(PackedScene) var weapon = null
export(PackedScene) var dust_particles = null

export(int,0,99999) var hit_points = 10

var prop_head = "prop_head"
var prop_torso = "prop_torso"
var prop_backpack = "prop_backpack"
var prop_left_hand = "prop_left_hand"
var prop_right_hand = "prop_right_hand"
var prop_particles = "prop_particles"

onready var anim = get_node("anim")
onready var bounds = get_node("area")

var begin = Vector3()
var end = Vector3()

var idle_state = true

var path = []
var is_left_hand = false

var player_owner = 0

func _path():
	if path.size() > 1:
		var to_walk = delta * SPEED
		var to_watch = Vector3(0, 1, 0)
		while to_walk > 0 and path.size() >= 2:
			var pfrom = path[path.size() - 1]
			var pto = path[path.size() - 2]
			to_watch = (pto - pfrom).normalized()
			var d = pfrom.distance_to(pto)
			if d <= to_walk:
				path.remove(path.size() - 1)
				to_walk -= d
			else:
				path[path.size() - 1] = pfrom.linear_interpolate(pto, to_walk/d)
				to_walk = 0
		
		var atpos = path[path.size() - 1]
		var atdir = to_watch
		atdir.y = 0
		
		var t = Transform()
		t.origin = atpos
		t = t.looking_at(atpos + atdir, Vector3(0, 1, 0))
		get_node("object").set_transform(t)
		
		if path.size() < 2:
			path = []
			idle_state = true
	else:
		idle_state = true

func _process(delta):
	path()
	if hit_points == 0:
		kill()
	pass


func _update_path():
	var p = get_simple_path(begin, end, true)
	path = Array(p) # Vector3array too complex to use, convert to regular array
	path.invert()
	set_process(true)


func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position)*100
		var p = navigation.get_closest_point_to_segment(from, to)
		
		begin = navigation.get_closest_point(get_node("object").get_translation())
		end = p

		_update_path()


func _ready():
	if hat != null:
		_add_prop(prop_head,hat)
	else:
		return
	if torso != null:
		_add_prop(prop_torso,torso)
	else:
		return
	if backpack != null:
		_add_prop(prop_backpack,backpack)
	else:
		return
	if weapon != null:
		if is_left_hand == true:
			_add_prop(prop_left_hand,weapon)
		else:
			_add_prop(prop_right_hand,weapon)
	else:
		return
	if dust_particles != null:
		_add_prop(prop_particles,dust_particles)
	else:
		return
	set_process_input(true)


func _add_prop(prop_name="",scene=null):
	var new_prop = scene.instance()
	new_prop.translation = get_node(prop_name).translation
	get_node(prop_name).add_node(new_prop)
	pass


func kill():
	queue_free()
