extends ItemList

export (int,0,3) var type = 0 # 0 is villager, 1 is solider, 2 is ship and 3 is building

export(int,0,10) var type_building

var current_object_selected = null

func _ready():
	if type == 0:
		for i in range(23):
			add_item("",preload("res://Art/UI/unit_icons/null_icon.png"),true)
		pass
	if type == 1:
		add_item("",preload("res://Art/UI/unit_icons/null_icon.png"),true)
		add_item("",preload("res://Art/UI/unit_icons/null_icon.png"),true)
		add_item("",preload("res://Art/UI/unit_icons/null_icon.png"),true)
		pass
	if type == 2:
		add_item("",preload("res://Art/UI/unit_icons/null_icon.png"),true)
		add_item("",preload("res://Art/UI/unit_icons/null_icon.png"),true)
		add_item("",preload("res://Art/UI/unit_icons/null_icon.png"),true)
		pass
	if type == 3:
		add_item("",preload("res://Art/UI/unit_icons/null_icon.png"),true)
		add_item("",preload("res://Art/UI/unit_icons/null_icon.png"),true)
		pass
	pass





func _on_commands_item_selected(index):
	if type == 0:
		if index == 0:
			print("Town Center Select")
			pass
		if index == 1:
			print("House Select")
			pass
		if index == 2:
			print("Market Select")
			pass
		if index == 3:
			print("Barracks Select")
			pass
		if index == 4:
			print("Stable Select")
			pass
		if index == 5:
			print("Tower Select")
			pass
		if index == 6:
			print("Artillery Fundation Select")
			pass
		if index == 7:
			print("Mill Select")
			pass
		if index == 8:
			print("Enbassy Select")
			pass
		if index == 9:
			print("Temple Select")
			pass
		if index == 10:
			print("Fort Select")
			pass
		if index == 11:
			print("Dock Select")
			pass
		if index == 12:
			print("Plantation Select")
			pass
		if index == 13:
			print("Forest Plantation Select")
			pass
		if index == 14:
			print("Tent Select")
			pass
		if index == 15:
			print("Congress/Town Hall Select")
			pass
		if index == 16:
			print("Capitol Select")
			pass
		if index == 17:
			print("Presidio/StarFort Select")
			pass
		if index == 18:
			print("Pulqueria/Taver Select")
			pass
		if index == 19:
			print("Imigrant Town Hall Select")
			pass
		if index == 20:
			print("Imigrant House Select")
			pass
		if index == 21:
			print("Univercity Select")
			pass
		if index == 22:
			print("Special Building 1 Select")
			pass
		if index == 23:
			print("Special Building 2 Select")
			pass
		pass
	if type == 1:
		if index == 0:
			print("Attack!")
			attack_command()
		if index == 1:
			print("Stop")
			stop_command()
		if index == 2:
			print("Patrol")
			patrol_command()
		pass
	if type == 2:
		if index == 0:
			print("Attack!")
			attack_command()
		if index == 1:
			print("Stop")
			stop_command()
		if index == 2:
			print("Patrol")
			patrol_command()
		pass
	if type == 3:
		if type_building == 0:
			if index == 0:
				print("Train Unit Select")
				train_unit(null)
			if index == 1:
				print("Update Select")
				upgrate(null)
		pass
	pass # replace with function body


func attack_command():
	pass

func patrol_command():
	pass

func stop_command():
	pass

func train_unit(unit=PackedScene):
	pass

func select_building(building=PackedScene):
	pass

func upgrate(upgrate_file=null):
	pass

func villager_buttons(type=0,civ=0):
	pass

func building_buttons(type=0,civ=0):
	if type == 0:
		#town center like buildings
		pass 
	if type == 1:
		#house like buildings
		pass
	if type == 2:
		#market like buildings
		pass
	if type == 3:
		#barracks like buildings
		pass
	if type == 4:
		#stable like buildings
		pass
	if type == 5:
		#fort like buildings
		pass
	if type == 6:
		#artillery like buildings
		pass
	if type == 7:
		#factory like building
		pass
	if type == 8:
		#Congress building
		pass
	if type == 9:
		#Town Hall building
		pass
	if type == 10:
		#Tower building
		pass
	if type == 11:
		pass
	pass

func militia_buttons(type=0):
	if type == 0:
		pass
	if type == 1:
		pass
	if type == 2:
		pass
	pass

