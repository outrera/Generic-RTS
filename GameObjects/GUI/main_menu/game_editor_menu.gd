extends Control



func _on_civ_editor_pressed():
	get_tree().change_scene_to(preload("res://CiviEditor.tscn"))
	pass # replace with function body



func _on_unit_editor_pressed():
	pass # replace with function body




func _on_map_editor_pressed():
	get_tree().change_scene_to(preload("res://MapEditor.tscn"))
	pass # replace with function body




func _on_back_pressed():
	get_tree().change_scene_to(preload("res://Main.scn"))
	pass # replace with function body
