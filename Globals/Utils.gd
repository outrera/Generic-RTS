extends Node

const RAY_LEGTH = 1000
const MAX_POPULATION = 1000
const MAX_RESOURCE = 99999

var singlepalyer_scene = null
var options_scene = null
var editor_scene = null
var history_scene = null


enum PLAYERS {
	GAIA,PLAYER1,PLAYER2,PLAYER3,PLAYER4,PLAYER5,PLAYER6,
	PLAYER7,PLAYER8
}

enum RESOURCES {
	FOOD,WOOD,GOLD,STONE,POPULATION,EXPORT,MILITAR_POPULATION
}

const PLAYERS_COLORS = {
	"RED":Color("FF0000"),
	"GREEN":Color("00FF00"),
	"BLUE":Color("0000FF"),
	"MAGENTA":Color("FF00FF"),
	"MAROON":Color("800000"),
	"OLIVE":Color("808000"),
	"DARK_GREEN":Color("008000"),
	"PURPLE":Color("800080"),
	"TEAL":Color("008080"),
	"NAVY":Color("000080"),
	"WHITE":Color("FFFFFF"),
	"BlACK":Color("000000")
}

var current_civ = ""

func setTitleWindow(title=""):
	OS.set_window_title(title)
	pass


func ScreenPosTo3D(camera):
	var mouse_pos = get_viewport().get_mouse_position()
	var from = camera.project_ray_origin(mouse_pos)
	var to = from +camera.project_ray_normal(mouse_pos)
	var space_state = get_world().direct_space_state
	var result = space_state.intersect_ray(from,to)
	return result
	pass

func fps(root=null,pos=Vector2(0,0)):
	var fps_label = Label.new()
	var frames_per_secound = OS.get_ticks_msec()
	fps_label.text = str(frames_per_secound)
	pass


func exitGame():
	get_tree().quit()
	pass

