extends Spatial

onready var player = get_parent().get_parent().get_node("Players/player_1")

export (PackedScene) var building = null
export (PackedScene) var building_fundation = preload("res://temporal/building_fundation_test.tscn")

onready var player_node = get_parent().get_parent().get_node("Structures/Players")


func _ready():
	var new_obj = building.instance()
	add_child(new_obj)
	set_process_input(true)
	pass


func _input(event):
	if event.is_class("InputEventMouseMotion"):
		var from = get_viewport().get_camera().project_ray_origin(get_viewport().get_mouse_position())
		var ray_direction = get_viewport().get_camera().project_ray_normal(get_viewport().get_mouse_position())
		var to = from + ray_direction*1000.00
		var space = get_viewport().get_camera().get_world().direct_space_state
		var hit = space.intersect_ray(from,to)
			
		if hit.has("position"):
			if hit.size() != 0:
				#currentObject.move_and_slide(Vector3(hit.position.x,0,hit.position.z),Vector3(0,hit.normal.y,0))
				currentObject.translation.x = hit.position.x
				currentObject.translation.y = hit.normal.y
				currentObject.translation.z = hit.position.z
	if event.is_action_pressed("click_left"):
		var new_obj = building_fundation.instance()
		new_obj.translation = get_parent().translation
		new_obj.player_owner = player.player_number
		player_node.add_child(new_obj)
		self.queue_free()
	pass
