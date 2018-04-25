extends Panel


var start_pos = Vector2()
var end_pos = Vector2()

var rect = get_rect()



func _process(delta):
	
	if Input.is_action_pressed("click_left"):
		get_rect().position = get_viewport().get_mouse_position()
	if Input.is_action_just_released("click_left"):
		rect.size.y = get_viewport().get_mouse_position().y
		pass
