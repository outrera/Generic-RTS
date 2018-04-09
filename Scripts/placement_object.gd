extends Mesh



var material = SpatialMaterial.new()
var red = Color("c25c5c")
var green = Color("5cc271")

func _ready():
	set_process_input(true)
	material.flags_transparent = true
	material.params_blend_mode = material.BLEND_MODE_ADD
	material.albedo_color = green
	material.emission_enabled = true
	material.emission = green
	mesh.set_surface_material(0,material)
	pass

func _input(event):
	if event.is_class("InputMouseButton") and event.button_index == BUTTON_LEFT and event.is_pressed():
		print("fundations in terrain")

func _on_area_body_entered(body):
	if body == KinematicBody:
		material.albedo_color = red
		material.emission = red
	elif body == RigidBody:
		material.albedo_color = red
		material.emission = red
	elif body == KinematicBody and body.name != "Terrain":
		material.albedo_color = red
		material.emission = red
	pass # replace with function body


func _on_area_body_exited(body):
	material.albedo_color = green
	material.emission = green
	pass # replace with function body
