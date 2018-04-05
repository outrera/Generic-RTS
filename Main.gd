extends Node

onready var persistence = get_node("Persistence")

var DefaultConfigurations = {
	"Win_relosultion":Vector2(1300,720),
	"AdvanceShaders":true,
	"AdvancePhysics":true,
	"WaterReflections":true,
	"WaterDeapColor":true,
	"Skybox":true,
	"Fog":true,
	"AutoExposure":true,
	"SSReflections":true,
	"SSAO":true,
	"Glow":true,
	"Adjustments":true
}

var PlayerPerfile = {
	"Name":"Anón",
	"Passworld":"1234567890"
}

func _init():
	var data = persistence.get_data()
	data["Configurations"] = DefaultConfigurations
	persistence.save_data("GameConfigurations")
	pass

