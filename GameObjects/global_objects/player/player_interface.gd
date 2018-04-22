extends Control


var food_amount = 0
var wood_amount = 0
var stone_amount = 0
var gold_amount = 0
var pop_current = 0
var max_population = 0
var exportation_amount = 0
var solider_amount = 0

func _ready():
	$civ_panel/box/resources/box/food/food_label.bbcode_text = "[img]res://Art/UI/icons/food_icon.png[/img]" + str(food_amount)
	$civ_panel/box/resources/box/wood/wood_label.bbcode_text = "[img]res://Art/UI/icons/wood_icon.png[/img]"+str(wood_amount)
	$civ_panel/box/resources/box/stone/stone_label.bbcode_text = "[img]res://Art/UI/icons/stone_icon.png[/img]"+str(stone_amount)
	$civ_panel/box/resources/box/gold/gold_label.bbcode_text = "[img]res://Art/UI/icons/gold_icon.png[/img]"+str(gold_amount)
	$civ_panel/box/resources/box/population/population_label.bbcode_text = "[img]res://Art/UI/icons/population_icon.png[/img]"+ \
	str(pop_current) + "/" + str(max_population)
	$civ_panel/box/resources/box/exportation/exportation_label.bbcode_text ="[img]res://Art/UI/icons/export_icon.png[/img]" + str(exportation_amount)
	$civ_panel/box/resources/box/soliders/solider_label.bbcode_text = str(solider_amount)
	pass

func _process(delta):
	pass


func _on_menu_button_pressed():
	$Menu.show()
	pass # replace with function body




func _on_objetives_button_pressed():
	$Objetives.show()
	pass # replace with function body




func _on_diplomacy_button_pressed():
	$Diplomacy.show()
	pass # replace with function body
