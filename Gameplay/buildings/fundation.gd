extends "res://Gameplay/buildings/building.gd"

export (String) var cultural_name = "Fundicion de Artilleria"

var meshes = {
	"MexicanRepublic":[],
	"MexicanEmpire":[],
	"USAUnion":[],
	"USAConfederate":[]
}

onready var mesh = get_node("mesh")
onready var spawn_point = get_node("spawn_point")

export (int,0,4) var culture = 0 # 0 is mexican 1 is mexican_empire 3 is usa_union 4 is usa_confederate


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