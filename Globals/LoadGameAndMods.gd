extends Node

var search_path = "user://modos"



func _init():
	load_mod("pck")
	load_mod("zip")

func load_mod(extension):
	
	var dir = Directory.new()
	
	if dir.open(search_path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				if file_name != "." and file_name != "..":
					print("Found file " + file_name)
			else:
				if file_name.extension() == extension:
					print("Found pack" + file_name.basename())
			file_name = dir.get_next()
			ProjectSettings.load_resource_pack(path+"/"+file_name.basename()+extension)
	else:
		print("No found pck or zip file here.")
	
	pass
