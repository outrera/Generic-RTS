extends Node



func _ready():
	
	pass

func _process(delta):
	if Input.is_action_just_pressed("exit_game_command"):
		get_tree().quit()
	if Input.is_action_just_pressed("open_command_panel"):
		pass
	pass
