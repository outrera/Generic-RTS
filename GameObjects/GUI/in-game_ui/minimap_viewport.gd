extends Spatial



var host_units = Color(0,0,1)
var selected_units = Color(1,1,1)
var enemy_units = Color(1,0,0)
var ally_units = Color(1,1,0)
var trees = Color("274936")
var animals = Color("484927")
var gold_mine = Color("edf17f")
var stone_mine = Color("9d9d9d")


func _ready():
	viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")

func colorizeMinimap():
	pass