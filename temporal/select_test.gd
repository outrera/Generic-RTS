extends KinematicBody


var is_select = false

func _on_test_input_event(camera, event, click_position, click_normal, shape_idx):
	if event.is_action_pressed("click_left"):
		if !is_select:
			$mesh.get_surface_material(0).albedo_color = Color(0.0,1.0,0.0)
			is_select = true
		else:
			$mesh.get_surface_material(0).albedo_color = Color(1.0,0.0,0.0)
			is_select = false
		pass
	pass # replace with function body
