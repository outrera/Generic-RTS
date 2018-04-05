extends Node

export (int,1,12) var player_resources = 1

var food = 500
var wood = 500
var gold = 50
var stone = 500
var population = 0
var maxPopulation = 0


onready var food_label = get_parent().get_node("UI/top_panel/food_label")
onready var wood_label = get_parent().get_node("UI/top_panel/wood_label")
onready var gold_label = get_parent().get_node("UI/top_panel/gold_label")
onready var stone_label = get_parent().get_node("UI/top_panel/stone_label")
onready var population_label = get_parent().get_node("UI/top_panel/pop_label")


func _ready():
	food_label.text = str(food)
	wood_label.text = str(wood)
	gold_label.text = str(gold)
	stone_label.text = str(stone)
	population_label.text = str(population) + "/" + str(maxPopulation)

func _process(delta):
	food_label.text = str(food)
	wood_label.text = str(wood)
	gold_label.text = str(gold)
	stone_label.text = str(stone)
	population_label.text = str(population) + "/" + str(maxPopulation)