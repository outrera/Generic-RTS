tool
extends EditorScenePostImport

var terrain_material = preload("res://Materials/default_terrain.material")
var water_material = preload("res://addons/water_shader/WaterShaderMaterial.tres")


func post_import(scene):
	return scene
