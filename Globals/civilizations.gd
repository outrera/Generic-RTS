extends Node

#Aqui estaran los nombres de las civilizaciones y otras cosas
var civilizations = "res://data/civilizations.data"

var culture = {
	"America":["NorteAmerica","CentroAmerica","Caribe","SurAmerica"],
	"Europa":["EuropaOriental","EuropaOcidental","EuropaCentral","Iberia","Balcanes","Turco"],
	"Africa":["AfricaMusulmana","AfricaColonial","AfricaTribal"],
	"Oceania":["OceaniaAnglosajona","OceaniaPolinesia"],
	"Asia":["Indu","Persico","Chino","Japones","FilipinoEspañol","Coreano"],
	"OrienteMedio":["Musulmana","Colonia"],
}

var villagers_on_start = 5
var explorers_on_start = 1

var starting_food = 100
var starting_wood = 100
var starting_gold =  50
var starting_stone = 100
var starting_metal = 100
var starting_fevor = 50
var starting_population = 10

var town_center = null
