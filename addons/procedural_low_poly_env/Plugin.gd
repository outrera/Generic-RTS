tool
extends EditorPlugin
signal generate_mesh
signal load_mesh
var dock # A class member to hold the dock during the plugin lifecycle
var meshGenerator
func _enter_tree():
	# Initialization of the plugin goes here
	# First load the dock scene and instance it:
	dock = preload("res://addons/procedural_low_poly_env/MainMenu.tscn").instance()
	#connect( String signal, Object target, String method, Array binds=[  ], int flags=0 )
	dock.connect("generate_mesh", self, "_on_generate")
	dock.connect("load_mesh", self, "_on_load_button")
	# Add the loaded scene to the docks:
	add_control_to_dock( DOCK_SLOT_LEFT_UR, dock)
	
	# Note that LEFT_UL means the left of the editor, upper-left dock
	print ("plugin tree entered")


func _exit_tree():
	# Clean-up of the plugin goes here
	# Remove the scene from the docks:
	print ("exit tree")
	remove_control_from_docks( dock ) # Remove the dock
	dock.free() # Erase the control from the memory
	print ("dock removed and free-ed")

func _on_generate(mesh):
	print ("on generate in dock plugin")
	var edited_scene = get_tree().get_edited_scene_root()
	
#	var low_poly_scene = edited_scene.find_node("Low poly scene")	
#	if (!low_poly_scene):
#		pass
#	else:
#		edited_scene.remove_child(low_poly_scene)
#		low_poly_scene.queue_free()
	var props_scene = edited_scene.find_node("props")	
	if (props_scene):
		edited_scene.remove_child(props_scene)
		props_scene.queue_free()
	
	var low_poly_terrain = edited_scene.find_node("low poly terrain")	
	if (!low_poly_terrain):
		low_poly_terrain = MeshInstance.new()
		low_poly_terrain.set_name("low poly terrain")
	
#	low_poly_scene = Spatial.new()
#	low_poly_scene.set_name("Low poly scene")
#	edited_scene.add_child(low_poly_scene)
#	low_poly_scene.set_owner(edited_scene)
	
#	var low_poly_terrain = MeshInstance.new()
#	low_poly_terrain.set_name("low poly terrain")
	#low_poly_terrain.queue_free()
#	
#	low_poly_scene.add_child(low_poly_terrain)
#	low_poly_terrain.set_owner(low_poly_scene)
	#new_node.mesh = mesh
	
#	var packed_scene = PackedScene.new()
#	packed_scene.pack(low_poly_terrain)
#	ResourceSaver.save("res://low poly terrain.tscn", packed_scene)
	
	ResourceSaver.save("res://terrain_mesh.tres", mesh)
	low_poly_terrain.set_mesh(load("res://terrain_mesh.tres"))
	edited_scene.add_child(low_poly_terrain)
	low_poly_terrain.set_owner(edited_scene)
#	var terrainNode = ResourceLoader.load("res://low poly terrain.tscn").instance()	
#	low_poly_scene.add_child(terrainNode)
#	terrainNode.set_owner(low_poly_scene)
#	var propNode = ResourceLoader.load("res://prop.tscn").instance()
#	low_poly_scene.add_child(propNode)
#	propNode.set_owner(low_poly_scene)

	var propNode = ResourceLoader.load("res://prop.tscn").instance()
	edited_scene.add_child(propNode)
	propNode.set_owner(edited_scene)
	
	
	
#	low_poly_scene.add_child(propNode)
#	propNode.set_owner(low_poly_scene)
	
#	packed_scene = PackedScene.new()
#	packed_scene.pack(low_poly_scene)
#	ResourceSaver.save("res://low poly scene.tscn",packed_scene)
	
#	var sceneInstance = ResourceLoader.load("res://low poly scene.tscn").instance()
#	edited_scene.add_child(sceneInstance)
#	sceneInstance.set_owner(edited_scene)
	
	
#	low_poly_terrain.queue_free()
#	propNode.queue_free()
	
#	low_poly_scene.remove_child(low_poly_terrain)
#	low_poly_scene.remove_child(propNode)
#	low_poly_scene.queue_free()
func _on_load_button():
	print ("on load button in dock plugin")
	pass

func edit(object):
	if (object is Node):
		print ("this is a node")
	if (object is MeshInstance):
		print("mesh: ",object.mesh)
		

func handles(object):
	if (object is Node):
		print ("handled")
	return true