extends ColorRect




func _process(delta):
	
	var t = 0
	
	t += delta
	
	color = Color(rand_range(0.0,1.0),rand_range(0.0,1.0),rand_range(0.0,1.0),rand_range(0.0,1.0))
