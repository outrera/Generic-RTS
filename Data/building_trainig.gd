extends "res://Data/building.gd"

onready var spawn_point = get_node("spawn_point")
onready var projectile_spawn = get_node("projectile_spawn")

export (float) var attack_points = 15.2
export (Array) var units
export (bool) var can_attack = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
