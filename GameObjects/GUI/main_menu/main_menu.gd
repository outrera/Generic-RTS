extends Panel

func _init():
	OS.set_window_title("RTS Demo v1.0.0")

func _on_start_button_pressed():
	get_tree().change_scene_to(preload("res://MapRoot.tscn"))
	pass # replace with function body




func _on_option_button_pressed():
	pass # replace with function body




func _on_game_editor_button_pressed():
	get_tree().change_scene_to(preload("res://GameEditor.scn"))
	pass # replace with function body




func _on_exit_button_pressed():
	get_tree().quit()
	pass # replace with function body
