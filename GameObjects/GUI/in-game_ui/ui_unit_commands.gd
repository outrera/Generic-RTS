extends TabContainer

var type = 0 # 0 es nada, 1 es aldeano, 2 es mercante, 3 es militar, 4 es barco_militar,5 es edificio

var commands_data = null



func _process(delta):
	commandsData(type,commands_data)
	pass


func commandsData(t,data):
	if t == 0:
#		for i in $Economic/commands_buttons.get_item_count():
#			$Economic/commands_buttons.remove_item(i)
#		for i in $Militar/commands_buttons.get_item_count():
#			$Militar/commands_buttons.remove_item(i)
		pass
	elif t == 1:
		setData(data)
		pass
	elif t == 2:
		setData(data)
		pass
	elif t == 3:
		setData(data)
		pass
	elif t == 4:
		setData(data)
		pass
	elif t == 5:
		setData(data)
		pass

func setData(data):
	var data_config = ConfigFile.new()
	data_config.open(data)
	pass