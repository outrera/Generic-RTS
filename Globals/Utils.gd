extends Node

const RAY_LEGTH = 1000
const MAX_POPULATION = 1000
const MAX_RESOURCE = 99999

enum PLAYERS {
	GAIA,PLAYER1,PLAYER2,PLAYER3,PLAYER4,PLAYER5,PLAYER6,
	PLAYER7,PLAYER8,PLAYER9,PLAYER10,PLAYER11,PLAYER12
}

enum RESOURCES {
	FOOD,WOOD,GOLD,STONE,POPULATION
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

const RESOURCE_TYPES = {
	"FOOD":[],
	"WOOD":[],
	"GOLD":[],
	"STONE":[]
}


func createTexture(x=512,y=512,use_mipmaps=false,format=Image.FORMAT_RGBA8,path="res://"):
	var image = Image.new()
	image.create(x,y,use_mipmaps,format)
	for i in range(x):
		for j in range(y):
			image.lock()
			image.set_pixel(i,j,Color(1.0,1.0,1.0,1.0))
			image.unlock()
	image.save_png(path)
	pass


func createBaseScene():
	var terrainGroups = Spatial.new()
	var worldObjects = Spatial.new()
	var ambientObjects = Spatial.new()
	var unitsObjects = Spatial.new()
	var gaiaUnitsObj = Spatial.new()
	var playersUnitsObj = Spatial.new()
	var buildingsObjects = Spatial.new()
	var gaiaStructuresObj = Spatial.new()
	var playersStructuresObj = Spatial.new()
	terrainGroups.name = "TerrainGroups"
	worldObjects.name = "WorldObjects"
	ambientObjects.name = "Ambient"
	unitsObjects.name = "Units"
	gaiaUnitsObj.name = "GaiaUnits"
	playersUnitsObj.name = "PlayerUnits"
	buildingsObjects.name = "BuildingObjects"
	pass

