extends DirectionalLight

export (Color) var sun_color = Color("ffffff")
export (float) var sun_energy = 1.0
export (float) var sun_specular = 0.5
export (bool)  var sun_shadow = true
export (float) var sun_rotation = -147

func _ready():
	light_color = sun_color
	rotate_x(sun_rotation)
	light_energy = sun_energy
	light_specular = sun_specular
	shadow_enabled = sun_shadow
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
