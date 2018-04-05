extends "res://Gameplay/units/unit.gd"


export (String) var cultural_name = "Aldeano"
export (float) var gader_rate = 0.5
export (int) var attack = 5
export (float) var attack_range = 10

var meshes = {
	"MexicanRepublic":[],
	"MexicanEmpire":[],
	"USAUnion":[],
	"USAConfederate":[]
}


onready var mesh = get_node("mesh")
onready var anim = get_node("animation")

export (int,0,4) var culture = 0 # 0 is mexican 1 is mexican_empire 3 is usa_union 4 is usa_confederate

var is_gaderig_resources = false

var gader_waypoints = []

func _ready():
	if culture == 0:
		pass
	elif culture == 1:
		pass
	elif culture == 2:
		pass
	elif culture == 3:
		pass
	elif culture == 4:
		pass
	pass

