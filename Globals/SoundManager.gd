extends Node


var game_sounds = []





func add_sound_to_list(sound=null):
	game_sounds.append(sound)
	pass

func free_sound_of_list(sound=null):
	game_sounds.remove(sound)


func play_sound_list(audio_list=[],audio_player=null):
	for i in audio_list.size():
		audio_player.play(audio_list[i])
	pass