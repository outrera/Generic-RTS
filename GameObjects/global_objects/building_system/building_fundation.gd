extends StaticBody

export (int) var build_time = 100
export (Vector2) var building_size = Vector2(1,1)# the size of the area, boundry, go to hell english language
export (PackedScene) var stage1 = preload("res://temporal/stage1.tscn")
export (PackedScene) var stage2 = preload("res://temporal/stage2.tscn")
export (PackedScene) var stage3 = preload("res://temporal/stage3.tscn")
export (PackedScene) var complite_building = null

onready var mesh = get_node("mesh")#TODO: Add Multimesh
onready var shape = get_node("shape")
onready var root = get_node("root")

var t = 0

var player_owner = 0

func _ready():
	print(get_child(1).name)
	pass

func _process(delta):
	t += 1
	print(t)
	if t == 30:
		mesh.queue_free()
		shape.queue_free()
		var new_stage = stage1.instance()
		new_stage.name = "stage1"
		new_stage.translation = root.get_translation()
		add_child(new_stage)
	if t == 50:
		get_node("stage1").queue_free()
		var new_stage = stage2.instance()
		new_stage.name = "stage2"
		new_stage.translation = root.get_translation()
		add_child(new_stage)
	if t == 99:
		get_node("stage2").queue_free()
		var new_stage = stage3.instance()
		new_stage.translation = root.get_translation()
		add_child(new_stage)
	if t == 100:
		var obj = complite_building.instance()
		obj.translation = root.get_translation()
		obj.player_owner = player_owner
		get_parent().add_child(obj)
	if t == build_time:
		queue_free()
	pass
