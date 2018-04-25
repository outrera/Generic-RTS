extends Node

const MAX_SOUND_VOLUME = 100.0
const GAME_SPEED = 5

enum game_level {
	LOW,MEDIUM,HIGH,ULTRA
}

const display_resolutions = [
	Vector2(800,600),
	Vector2(1280, 720),
	Vector2(1366, 768),
	Vector2(1600, 900),
	Vector2(1920, 1080),
	Vector2(2560, 1440),
	Vector2(3200, 1800),
	Vector2(3840, 2160),
]


const settings_nodes = [
	# Low
	{
		"environment/glow_enabled": [false, "Disabled"],
		"environment/ss_reflections_enabled": [false, "Disabled"],
		"environment/ssao_enabled": [false, "Disabled"],
		"environment/ssao_blur": [Environment.SSAO_BLUR_1x1, ""],
		"environment/ssao_quality": [Environment.SSAO_QUALITY_LOW, ""],
		"rendering/quality/anisotropic_filter_level": [4, "4×"],
		"rendering/quality/filters/msaa": [Viewport.MSAA_DISABLED, "Disabled"],
		"rendering/quality/voxel_cone_tracing/high_quality": [false, "Low-quality"],
	},

	# Medium
	{
		"environment/glow_enabled": [false, "Disabled"],
		"environment/ss_reflections_enabled": [false, "Disabled"],
		"environment/ssao_enabled": [false, "Disabled"],
		"environment/ssao_blur": [Environment.SSAO_BLUR_1x1, ""],
		"environment/ssao_quality": [Environment.SSAO_QUALITY_LOW, ""],
		"rendering/quality/anisotropic_filter_level": [8, "8×"],
		"rendering/quality/filters/msaa": [Viewport.MSAA_2X, "2×"],
		"rendering/quality/voxel_cone_tracing/high_quality": [false, "Low-quality"],
	},

	# High
	{
		"environment/glow_enabled": [true, "Enabled"],
		"environment/ss_reflections_enabled": [false, "Disabled"],
		"environment/ssao_enabled": [true, "Medium-quality"],
		"environment/ssao_blur": [Environment.SSAO_BLUR_1x1, ""],
		"environment/ssao_quality": [Environment.SSAO_QUALITY_LOW, ""],
		"rendering/quality/anisotropic_filter_level": [16, "16×"],
		"rendering/quality/filters/msaa": [Viewport.MSAA_4X, "4×"],
		"rendering/quality/voxel_cone_tracing/high_quality": [false, "Low-quality"],
	},

	# Ultra
	{
		"environment/glow_enabled": [true, "Enabled"],
		"environment/ss_reflections_enabled": [true, "Enabled"],
		"environment/ssao_enabled": [true, "High-quality"],
		"environment/ssao_blur": [Environment.SSAO_BLUR_2x2, ""],
		"environment/ssao_quality": [Environment.SSAO_QUALITY_MEDIUM, ""],
		"rendering/quality/anisotropic_filter_level": [16, "16×"],
		"rendering/quality/filters/msaa": [Viewport.MSAA_8X, "8×"],
		"rendering/quality/voxel_cone_tracing/high_quality": [true, "High-quality"],
	},
]





#func graphics_change(setting):
#	for sett in settings_nodes[setting]:
#		var value = settings_nodes[setting][sett][0]
#		ProjectSettings.set_setting(sett,value)
#		match sett:
#			"environment/glow_enabled":
#				env.glow_enabled = value
#			"environment/ss_reflections_enabled":
#				env.ss_reflections_enabled = value
#			"environment/ssao_enabled":
#				env.ssao_enabled = value
#			"environment/ssao_blur":
#				env.ssao_blur = value
#			"environment/ssao_quality":
#				env.ssao_quality = value
#	pass
