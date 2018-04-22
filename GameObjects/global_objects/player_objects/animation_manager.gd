extends AnimationPlayer


var states = {
	"Idle":["Walk","Idle"],
	"Walk":["Idle"]
}


var speeds = {
	"Idle":1,
	"Walk":1.2,
}

var current_state = null
var callback_function = null

func _ready():
	set_animation("Idle")
	connect("animation_finished", self, "animation_ended")

func set_animation(animation_name):
	
	if animation_name == current_state:
		print ("animation_manager.gd -- WARNING: animation is already ", animation_name)
		return true
	
	if has_animation(animation_name) == true:
		
		if current_state != null:
			var possible_animations = states[current_state]
			
			if animation_name in possible_animations:
				current_state = animation_name
				play(animation_name,-1,speeds[animation_name])
				return true
			else:
				print ("animation_manager.gd -- WARNING: Cannot change to ", animation_name, " from ", current_state)
				return false
		else:
			current_state = animation_name
			play(animation_name,-1,speeds[animation_name])
			return true
	return false

func animation_ended(anim_name):
	if anim_name == "Idle":
		pass
	elif anim_name == "Walk":
		set_animation("Idle")
		pass
	pass

func animation_callback():
	if callback_function == null:
		print ("animation_manager.gd -- WARNING: No callback function for the animation to call!")
	else:
		callback_function.call_func()
	pass

