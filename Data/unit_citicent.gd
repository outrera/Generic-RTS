extends KinematicBody


const MOUNTED_SPEED = 32.4
const MOUNTED_RUN_SPEED = 38.2
const WALK_SPEED = 20.0
const RUN_SPEED = 25.0
const RAY_LENGH = 100.0

export (String) var culture_name = "Aldeano"
export (String) var generic_name = "Villager"

export (bool) var mounted_unit = false

export (PackedScene) var aspect = null

var camera = get_viewport().get_camera()


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
