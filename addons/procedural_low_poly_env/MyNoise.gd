tool
class MyNoise:
	var preScript = load("res://addons/procedural_low_poly_env/softnoise.gd")
	var noise	
	func _init(my_seed = 0):
		noise = preScript.SoftNoise.new(my_seed)
		pass
	
	func fractal_noise(x , y, freq,octave,persist):
		var value = 0
		for  i in range (1, octave):
			var j = float (i)
			value = value + (persist/j) * noise.openSimplex2D(x * j * freq , y * j * freq)
			#value = value + (persist/j) * preScript.simplex2(x * j * freq , y * j * freq)
		return value