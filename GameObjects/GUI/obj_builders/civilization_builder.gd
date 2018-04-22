extends PanelContainer

onready var file_name = get_node("bg/list/name/list/name_file/list/file_name")

onready var civ_name = get_node("bg/list/name/list/list/civi_name")
onready var civ_culture = get_node("bg/list/culture/list/list/culture_name")

onready var civ_sound1 = get_node("bg/list/sounds/list/sounds/list/sound1")
onready var civ_sound2 = get_node("bg/list/sounds/list/sounds/list/sound2")
onready var civ_sound3 = get_node("bg/list/sounds/list/sounds/list/sound3")
onready var civ_sound4 = get_node("bg/list/sounds/list/sounds/list/sound4")
onready var civ_sound5 = get_node("bg/list/sounds/list/sounds/list/sound5")

onready var civ_flag = get_node("bg/list/bottom/box/center/box/flag_path")
onready var civ_emblem = get_node("bg/list/bottom/box/bottom/box/emblem_path")
onready var civ_villagers = get_node("bg/list/bottom/box/starting_units/box/villager_number")
onready var civ_explorers = get_node("bg/list/bottom/box/starting_units/box/explorer_number")
onready var civ_militias = get_node("bg/list/bottom/box/starting_units/box/militar_numbers")
onready var civ_history = get_node("bg/list/sounds/list/history/history_text")

#politics
onready var politic1 = get_parent().get_node("center/bg/box/stage1/box/stage1_politic_1/stage1_politic1")
onready var politic2 = get_parent().get_node("center/bg/box/stage1/box/stage1_politic_2/stage1_politic2")
onready var politic3 = get_parent().get_node("center/bg/box/stage2/box/stage2_politic_1/stage2_politic1")
onready var politic4 = get_parent().get_node("center/bg/box/stage2/box/stage2_politic_2/stage2_politic2")
onready var politic5 = get_parent().get_node("center/bg/box/stage3/box/stage3_politic_1/stage3_politic1")
onready var politic6 = get_parent().get_node("center/bg/box/stage3/box/stage3_politic_2/stage3_politic1")
onready var politic7 = get_parent().get_node("center/bg/box/stage4/box/stage4_politic_1/stage4_politic1")
onready var politic8 = get_parent().get_node("center/bg/box/stage4/box/stage4_politic_2/stage4_politic2")
onready var politic9 = get_parent().get_node("center/bg/box/stage5/box/stage5_politic_1/stage5_politic1")
onready var politic10 = get_parent().get_node("center/bg/box/stage5/box/stage5_politic_2/stage5_politic2")
#politics

var data = []

func _ready():
	OS.set_window_title("Civilization Builder v1.0.1 alpha")
	OS.set_low_processor_usage_mode(true)
	set_process_input(true)
	pass

func _input(event):
	if event.is_action_pressed("save_data"):
		get_parent().get_parent().get_node("Confirmation").show()
		get_parent().get_parent().get_node("Confirmation").show_on_top = true
		pass
	
	pass

func _on_ConfirmationDialog_confirmed():
	var civ_file = ConfigFile.new()
	civ_file.load("res://Data/civs/"+file_name.text+".civ")
	civ_file.set_value("Civilization","Name",civ_name.text)
	civ_file.set_value("Civilization","Culture",civ_culture.text)
	civ_file.set_value("Civilization","Flag",civ_flag.text)
	civ_file.set_value("Civilization","Emblem",civ_emblem.text)
	civ_file.set_value("Civilization","History",civ_history.text)
	civ_file.set_value("Civilization","Music",[civ_sound1.text,civ_sound2.text,civ_sound3.text,civ_sound4.text,civ_sound5.text])
	civ_file.set_value("Civilization","Politics",[politic1.text,politic2.text,politic3.text,politic4.text,politic5.text,
	politic6.text,politic7.text,politic8.text,politic9.text,politic10.text])
	civ_file.set_value("Starting Units","Villagers",int(civ_villagers.value))
	civ_file.set_value("Starting Units","Militia",int(civ_militias.value))
	civ_file.set_value("Starting Units","Explorer",int(civ_explorers.value))
	civ_file.save("res://Data/civs/"+file_name.text+".civ")
	pass # replace with function body