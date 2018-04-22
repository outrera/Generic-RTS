extends Node


enum settings {LOW,MED,HIGH,VHIGH,CUSTOM}
enum textures_settings {LOW_RES,MED_RES,HIGH_RES}
enum shader_type {SIMPLE,ADVANCE}

enum terrain_settings {SIMPLE,SOME_DETALY,MID_DETALY,ALL_DETALY}

var settings_mode = settings.VHIGH


func _ready():
	self.set_process(true)
	pass

func _process(delta):
	if Input.is_action_just_pressed("low_settings_mode"):
		settings_mode = settings.LOW
		game_settings()
	if Input.is_action_just_pressed("max_settings_mode"):
		settings_mode = settings.VHIGH
		game_settings()
	pass

func game_settings():
	if settings_mode == settings.LOW:
		shaderType(shader_type.SIMPLE)
		textureSettings(textures_settings.LOW_RES)
		terrainSettings(terrain_settings.SIMPLE)
		pass
	if settings_mode == settings.MED:
		shaderType(shader_type.SIMPLE)
		textureSettings(textures_settings.MED_RES)
		terrainSettings(terrain_settings.MID_DETALY)
		pass
	if settings_mode == settings.HIGH:
		shaderType(shader_type.ADVANCE)
		texturesSettings(textures_settings.MED_RES)
		terrainSettings(terrain_settings.ALL_DETALY)
		pass
	if settings_mode == settings.VHIGH:
		shaderType(shader_type.ADVANCE)
		textureSettings(textures_settings.HIGH_RES)
		terrainSettings(terrain_settings.ALL_DETALY)
		pass
	pass

func textureSettings(resolution=textures_settings.HIGH_RES):
	
	pass

func shaderType(type=shader_type.ADVANCE):
	pass

func terrainSettings(render=terrain_settings.ALL_DETALY):
	pass
