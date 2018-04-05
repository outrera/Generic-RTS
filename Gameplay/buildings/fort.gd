extends "res://Gameplay/buildings/building.gd"

export (int) var attack = 50
export (float) var attack_radius = 60
export (String) var fort_name = "Guadalupe"
export (String) var cultural_name = "Fuerte"

var meshes = {
	"MexicanRepublic":[],
	"MexicanEmpire":[],
	"USAUnion":[],
	"USAConfederate":[]
}

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