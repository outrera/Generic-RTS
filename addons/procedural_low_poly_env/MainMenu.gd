tool
extends Node

var size_control
var freq_control
var oct_control
var pers_control
var terrainSize_control
var terrainHeight_control
var seed_control
signal generate_mesh (mesh)
signal load_mesh
var terrainScript = preload("res://addons/procedural_low_poly_env/LowPolyTerrain.gd")
var terrain
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	size_control = get_node("size")
	freq_control = get_node("frequency")
	oct_control = get_node("octave")
	pers_control = get_node("persist")
	terrainSize_control = get_node("terrain Size")
	terrainHeight_control = get_node("terrain Height")
	seed_control = get_node("Seed")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.


func _on_generate_button_down():
	size_control = get_node("size")
	freq_control = get_node("frequency")
	oct_control = get_node("octave")
	pers_control = get_node("persist")
	terrainSize_control = get_node("terrain Size")
	terrainHeight_control = get_node("terrain Height")
	seed_control = get_node("Seed")
	
	var index = size_control.get_selected()
	var text = size_control.get_item_text(index)
	
	var size = int(text)
	
	var frequency = freq_control.value
	var octave = oct_control.value
	var persist = pers_control.value
	
	var terrain_size = terrainSize_control.value
	var terrain_height = terrainHeight_control.value
	var _seed = seed_control.value
	
	terrain = terrainScript.LowPolyTerrain.new(_seed)
	
	print ("on generate button down")
	terrain.generateMap(size,size,frequency, octave,persist)
	terrain.normalize_01()
	terrain.island_mask(size)
	terrain.normalize_01()
	var mesh = terrain.createMesh(terrain_size, terrain_height)
	
	print (mesh)
	var props = terrain.generateProps()
#	var low_poly_terrain = MeshInstance.new()
#
#	low_poly_terrain.set_mesh(mesh)
#	low_poly_terrain.set_name("Low Poly Terrain")
#	#new_node.mesh = mesh
#	var packed_scene = PackedScene.new()
#	packed_scene.pack(low_poly_terrain)
#	ResourceSaver.save("res://low poly terrain.tscn", packed_scene)
#	var scene = Spatial.new()
#	scene.set_name("Low Poly Scene")
	
#	var low_poly_terrain = MeshInstance.new()
#	low_poly_terrain.set_name("Low Poly Terrain")
#	#new_node.mesh = mesh
#	low_poly_terrain.set_mesh(mesh)
#	print("writing terrain on disk")
#	var packed_scene = PackedScene.new()
#	packed_scene.pack(low_poly_terrain)
#	ResourceSaver.save("res://low poly terrain.tscn", packed_scene)
#	scene.add_child(low_poly_terrain)
#	scene.add_child(props)
#	props.set_owner(scene)
#	low_poly_terrain.set_owner(scene)
	
	#emit_signal("generate_mesh",scene)
	emit_signal("generate_mesh",mesh)

func _on_load_button_down():
	print ("on load button down")
	emit_signal("load_mesh")
