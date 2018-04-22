extends Control

var objects = []

var path = "res://Data/actors"


func _ready():
	load_objects()
	set_objects_to_list()
	pass

func load_objects():
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	
#	while true:
#		var file = dir.get_text()
#
#		if file == "":
#			break
#		elif not file.begins_with("."):
#			objects.append(file)
	
	dir.list_dir_end()
	return objects

func set_objects_to_list():
	for i in objects:
		$box/objects.add_item(str(i),null,true)
	pass