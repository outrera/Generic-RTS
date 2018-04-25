extends Spatial


var players = []

export (Array) var players_color
export (String,FILE) var map = null



var current_time = 0

func _ready():
	
	for i in $Players.get_child_count():
		players.append(i)
	
	for i in players.size():
		print(i)

func _process(delta):
	current_time += 1 * GameSettings.GAME_SPEED * delta
	$ui/ui/game_time.text = "time in game: " + str(int(current_time))
