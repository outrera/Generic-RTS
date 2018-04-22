extends Node

export (int,1,12) var player_resources = 1

var food = 500
var wood = 500
var gold = 500
var stone = 500
var metal = 500
var population = 0
var maxPopulation = 0


onready var food_label = get_parent().get_node("UI/top_panel/food_label")
onready var wood_label = get_parent().get_node("UI/top_panel/wood_label")
onready var gold_label = get_parent().get_node("UI/top_panel/gold_label")
onready var stone_label = get_parent().get_node("UI/top_panel/stone_label")
onready var population_label = get_parent().get_node("UI/top_panel/pop_label")

