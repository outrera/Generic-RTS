extends StaticBody

var prop_flag = "prop_flag"
var prop_projectile_spawn = "prop_projectile_spawn"
var prop_props = "props"
var prop_garison_flag = "prop_garison_flag"
var prop_spawn_object = "prop_spawn_object"

export(PackedScene) var flag = null
export(PackedScene) var projectile_type = null
export(PackedScene) var props = null
export(PackedScene) var garison_flag = null
export(int,1,99999) var hit_points = 10
export(int,0,99999) var attack_points = 1

var is_defencive = false
var player_owner = 0
var selected = false

onready var bounds = get_node("area")

func _ready():
	if flag != null:
		_add_prop(prop_flag,flag)
	if projectile_type != null:
		is_defencive = true
		pass
	if props != null:
		_add_prop(prop_props,props)
		pass
	if garison_flag != null:
		_add_prop(prop_garison_flag,garison_flag)

func _add_prop(prop_name="",scene=null):
	var new_prop = scene.instance()
	new_prop.translation = get_node(prop_name).translation
	get_node(prop_name).add_node(new_prop)


func obj_mouse_entered():
	if Input.is_action_pressed("click_left"):
		if selected == true:
			selected = false
		else:
			selected = true

func obj_mouse_exited():
	print("Adios")
