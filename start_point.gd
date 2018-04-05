extends Spatial

var town_center = []

var new_building

var culture = 0 # 0 is mexican 1 is mexican_empire 3 is usa_union 4 is usa_confederate

func _ready():
	if culture == 0:
		new_building = town_center[0].instance()
	elif culture == 1:
		new_building = town_center[1].instance()
	elif culture == 2:
		new_building = town_center[3].instance()
	elif culture == 3:
		new_building = town_center[4].instance()
	else:
		return
	new_building.translation = self.translation
	get_tree().add_child(new_building)
	queue_free()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
