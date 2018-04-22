extends Spatial

onready var anim = get_node("anim")


func _ready():
	set_process_input(true)


func _input(event):
	
	if event.is_action_pressed("click_left"):
		anim.play("Idle")
	
	elif event.is_action_pressed("click_right"):
		pass
