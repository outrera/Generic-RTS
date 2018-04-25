extends "res://GameObjects/global_objects/player/player.gd"


export (String) var ai_level = "easy"
export (String,FILE) var ai_file = null

var ai = ""

var actions = []
var goals = []

var is_out_of_game = false

func _ready():
	if ai_level == "easy":
		ai = "easy"
		pass
	elif ai_level == "normal":
		ai = "normal"
		pass
	elif ai_level == "hard":
		ai = "hard"
		pass
	else:
		print("Error: this ai " + ai_level +" is not valid,the valid ia names is easy, normal or hard")


func _process(delta):
	pass