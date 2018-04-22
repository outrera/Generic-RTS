extends Area



func _init():
	OS.window_fullscreen = false


func _ready():
	pass

func _on_StaticBody_mouse_entered():
	print("Hola")
	pass # replace with function body


func _on_StaticBody_mouse_exited():
	print("Adios")
	pass # replace with function body
