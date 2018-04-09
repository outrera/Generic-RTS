extends Spatial

onready var viewport = get_parent().get_node("Viewports/MinimapViewport")
onready var minimap_rect = get_parent().get_node("UI/Panels/MinimapPanel/background/minimap_rect")


var host_units = Color(0,0,1)
var selected_units = Color(1,1,1)
var enemy_units = Color(1,0,0)
var ally_units = Color(1,1,0)
var trees = Color("274936")
var animals = Color("484927")
var gold_mine = Color("edf17f")
var stone_mine = Color("9d9d9d")

var terrain_color_degregate = preload("res://Art/textures/minimap_gardient.tres")


func _ready():
	viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	
	minimap_rect.texture = viewport.get_texture()

func colorizeMinimap():
	pass