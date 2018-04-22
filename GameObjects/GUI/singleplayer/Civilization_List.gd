extends PanelContainer


func _ready():
	load_civi_list()
	pass

func save_civi_list():
	var civ_list = ConfigFile.new()
	civ_list.load("res://Globals/civilizations.data")
	civ_list.set_value("Civilizations-selected","Greate Britain",true)
	civ_list.set_value("Civilizations-name","Greate Britain","BRITAIN_NAME")
	civ_list.set_value("Civilizations-selected","Spain",true)
	civ_list.set_value("Civilizations-name","Spain","SPAIN_NAME")
	civ_list.set_value("Civilizations-selected","Empire of France",true)
	civ_list.set_value("Civilizations-name","Empire of France","FRANCE_NAME")
	civ_list.set_value("Civilizations-selected","Empire of Mexico",true)
	civ_list.set_value("Civilizations-name","Empire of Mexico","MEX_1_NAME")
	civ_list.set_value("Civilizations-selected","Republic of Mexico",true)
	civ_list.set_value("Civilizations-name","Republic of Mexico","MEX_2_NAME")
	civ_list.set_value("Civilizations-selected","Unite States",true)
	civ_list.set_value("Civilizations-name","Unite States","USA_1_NAME")
	civ_list.set_value("Civilizations-selected","Confederate States",true)
	civ_list.set_value("Civilizations-name","Confederate States","USA_2_NAME")
	civ_list.set_value("Civilizations-selected","Federation of Centralamerica",false)
	civ_list.set_value("Civilizations-name","Federation of Centralamerica","FOC_NAME")
	civ_list.save("res://Globals/civilizations.data")

func load_civi_list():
	var civ_list = ConfigFile.new()
	civ_list.load("res://Globals/civilizations.data")
	var britain_selected = civ_list.has_section_key("Civilizations-selected","Greate Britain")
	var britain_name = civ_list.has_section_key("Civilizations-name","Greate Britain")
	var spain_selected = civ_list.has_section_key("Civilizations-selected","Spain")
	var spain_name = civ_list.has_section_key("Civilizations-name","Spain")
	var france_selected = civ_list.has_section_key("Civilizations-selected","Empire of France")
	var france_name = civ_list.has_section_key("Civilizations-name","Empire of France")
	var mex_1_selected = civ_list.has_section_key("Civilizations-selected","Empire of Mexico")
	var mex_1_name = civ_list.has_section_key("Civilizations-name","Empire of Mexico")
	var mex_2_selected = civ_list.has_section_key("Civilizations-selected","Republic of Mexico")
	var mex_2_name = civ_list.has_section_key("Civilizations-name","Republic of Mexico")
	var usa_1_selected = civ_list.has_section_key("Civilizations-selected","Unite States")
	var usa_1_name = civ_list.has_section_key("Civilizations-name","Unite States")
	var usa_2_selected = civ_list.has_section_key("Civilizations-selected","Confederate States")
	var usa_2_name = civ_list.has_section_key("Civilizations-name","Confederate States")
	$list.add_item(str(britain_name),null,britain_selected)
	$list.add_item(str(spain_name),null,spain_selected)
	$list.add_item(str(france_name),null,france_selected)
	$list.add_item(str(mex_1_name),null,mex_1_selected)
	$list.add_item(str(mex_2_name),null,mex_2_selected)
	$list.add_item(str(usa_1_name),null,usa_1_selected)
	$list.add_item(str(usa_2_name),null,usa_2_selected)
	pass
