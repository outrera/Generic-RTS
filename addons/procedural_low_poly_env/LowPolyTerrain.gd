tool
class LowPolyTerrain:
	var ht #heightmap
	var width #width of the heightmap
	var lenght # lenght of the heightmap
	var size = 20 #size of the terrain
	var height = 5 # height of the terrain
	var dist #distance between two points of the heightmap
	var _freq
	var _octave
	var _persist
	var script = preload ("res://addons/procedural_low_poly_env/MyNoise.gd")
	var noise
	
	const color_green = Color(0.0, 0.4, 0.0)
	const color_brown = Color(0.05, 0.3, 0.0)
	const color_yellow = Color (0.4,0.5,0.0)
	const color_grey = Color (0.2,0.2,0.2)
	const color_white = Color (0.9,0.9,0.9)
	
	var surf_tool
	var mesh
	
	func _init(_seed = 0):
		noise = script.MyNoise.new(_seed)
		#softnoise.openSimplex2D(x, y)
		surf_tool = SurfaceTool.new()
		mesh = Mesh.new()
		
	
	func generateMap(size_x = 64, size_y = 64, freq = 10.0, octave = 4, persist = 0.5):
		_freq = float(freq)
		_octave = float(octave)
		_persist =float(persist)
		#softnoise.openSimplex2D(x, y)
		width = size_x
		lenght = size_y
		ht = []
		for i in range(width):
			ht.append([])
			for j in range(lenght):
				ht[i].append(j)
				ht[i][j] = noise.fractal_noise(i,j,_freq,_octave,_persist)
		pass
	
	func saveImage():
		var image = Image.new()
		image.create(width,lenght, 0, Image.FORMAT_RGB8)
		#to write on image must be locked
		image.lock()
		for i in range (width):
			for j in range (lenght):
				var value = ht[i][j]
				#value = value + 0.5
				var color = Color(value,value,value)
				image.set_pixel(i,j,color)
		image.unlock()
		image.save_png("res://terrain_image.png")
	
	func normalize_01():
		var maximum = -10000000000000000.0
		var minimum =  10000000000000000.0
		var temp = 0.0
		for i in range (width):
			for j in range (lenght):
				temp = ht[i][j]
				if (temp > maximum):
					maximum = temp
				if (temp < minimum):
					minimum = temp
		for i in range (width):
			for j in range (lenght):
				ht[i][j] = (ht[i][j]-minimum)/(maximum-minimum)
				
	func island_mask (edge = 20.0):
		for i in range (width):
			for j in range (lenght):
				ht[i][j] =ht[i][j] * ((- abs(i - (edge/2) ) + edge/2) * (- abs(j - (edge/2) ) + edge/2)) / (edge * edge / 20);
	
			
	func createMesh(size_ = 20, height_ = 5):
		size = float(size_)
		height =  float(height_)
		var half_size = size/2.0
		dist = float (size / width)
		print ("dist: ", dist)
		var x = 0
		if(ht):
			#surf_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
			surf_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
			for i in range (width-1):
				for j in range (lenght-1):
					var bottomleft = Vector3(i * dist - half_size, ht[i][j] * height, j * dist - half_size)
					var upperleft = Vector3(i * dist - half_size, ht[i][j + 1] * height, (j + 1) * dist - half_size)
					var upperright = Vector3((i + 1) * dist - half_size, ht[i + 1][j + 1] * height, (j + 1) * dist - half_size)
					var bottomright = Vector3((i + 1) * dist - half_size, ht[i + 1][j] * height, (j) * dist - half_size)
					
					#evaluate color first triangle
					
					var worst_height_diff = max(abs(bottomleft.y - bottomright.y),abs(bottomleft.y - bottomright.y))
					worst_height_diff = max (worst_height_diff,abs(bottomright.y - upperleft.y))
					#print("worst height difference = ", worst_height_diff)
					var color_interpolation_value = worst_height_diff / dist *1.5
					color_interpolation_value = clamp (color_interpolation_value, 0, 1)
					#print("color interpolation value = ", color_interpolation_value)
					var triangle_color = color_green
					
					if(worst_height_diff < lenght/2.0 and bottomleft.y < height/10.0):
						#triangle_color = color_yellow
						var average_height = (bottomleft.y + bottomright.y + upperleft.y)/3.0
						var weight = range_lerp(average_height, 0, height/10.0, 1, 0)
						triangle_color = triangle_color.linear_interpolate(color_yellow, weight)
						
					else:
						triangle_color = triangle_color.linear_interpolate(color_brown,color_interpolation_value)
					
					var average_height = (bottomleft.y + bottomright.y + upperleft.y)/3.0
					if (average_height > height * 0.8):
						triangle_color = color_white
					
					surf_tool.add_color(triangle_color)
					surf_tool.add_vertex(bottomleft)

					surf_tool.add_color(triangle_color)
					surf_tool.add_vertex(bottomright)

					surf_tool.add_color(triangle_color)
					surf_tool.add_vertex(upperleft)
					#surf_tool.generate_normals()
					
					#evaluate color second triangle
					worst_height_diff = max(abs(upperright.y - bottomright.y),abs(upperright.y - bottomright.y))
					worst_height_diff = max (worst_height_diff,abs(bottomright.y - upperleft.y))
					color_interpolation_value = worst_height_diff / dist *1.5
					color_interpolation_value = clamp (color_interpolation_value, 0, 1)
					triangle_color = color_green
					
					if(worst_height_diff < lenght/2.0 and upperright.y < height/10.0):
						#triangle_color = color_yellow
						average_height = (upperright.y + bottomright.y + upperleft.y)/3.0
						var weight = range_lerp(average_height, 0, height/10.0, 1, 0)
						triangle_color = triangle_color.linear_interpolate(color_yellow, weight)						
					else:
						triangle_color = triangle_color.linear_interpolate(color_brown,color_interpolation_value)
						
					average_height = (upperright.y + bottomright.y + upperleft.y)/3.0
					if (average_height > height * 0.8):
						triangle_color = color_white
					surf_tool.add_color(triangle_color)
					surf_tool.add_vertex(bottomright)


					surf_tool.add_color(triangle_color)
					surf_tool.add_vertex(upperright)


					surf_tool.add_color(triangle_color)
					surf_tool.add_vertex(upperleft)
					#surf_tool.generate_normals()
		
		surf_tool.generate_normals()
		#"res://addons/procedural_low_poly_env/materials/VertexColorMaterial.tres"
		var material = ResourceLoader.load("res://addons/procedural_low_poly_env/materials/material_vertex_color.tres")
		surf_tool.set_material(material)
		mesh = surf_tool.commit()
		print(mesh)
		
		return mesh
		
	func generateProps():
		
		var half_size = size/2.0
		dist = float (size / width)
		var h_dist = dist/2.0
		var prop = Spatial.new()
		prop.set_name("props")
		var treeResource = ResourceLoader.load("res://addons/procedural_low_poly_env/Nature Props/Tree 1.tscn")
		var stoneResource = ResourceLoader.load("res://addons/procedural_low_poly_env/Nature Props/Stone 1.tscn")
		if(ht):
			#recalculate all vertex
			for i in range (width-1):
				for j in range (lenght-1):
					var bottomleft = Vector3(i * dist - half_size, ht[i][j] * height, j * dist - half_size)
					var upperleft = Vector3(i * dist - half_size, ht[i][j + 1] * height, (j + 1) * dist - half_size)
					var upperright = Vector3((i + 1) * dist - half_size, ht[i + 1][j + 1] * height, (j + 1) * dist - half_size)
					var bottomright = Vector3((i + 1) * dist - half_size, ht[i + 1][j] * height, (j) * dist - half_size)

					var worst_height_diff = max(abs(bottomleft.y - bottomright.y),abs(bottomleft.y - bottomright.y))
					worst_height_diff = max (worst_height_diff,abs(bottomright.y - upperleft.y))
					worst_height_diff = max (worst_height_diff,abs(upperright.y - upperleft.y))
					worst_height_diff = max (worst_height_diff,abs(upperright.y - bottomright.y))
					
					var steepness = worst_height_diff / dist
					#var middle_point = (bottomleft + bottomright + upperleft + bottomright) / 4.0
					var middle_point = (upperleft + bottomright) / 2.0
					if (steepness < 0.2 and middle_point.y > height/10.0):
						middle_point = middle_point + Vector3(rand_range(-h_dist,h_dist),0,rand_range(-h_dist,h_dist))
						var treeInstance = treeResource.instance()
						treeInstance.translate(middle_point)
						prop.add_child(treeInstance)
						treeInstance.set_owner(prop)
						
					if (steepness < 0.4 and middle_point.y > height/100.0):
						if (rand_range(0,1) > 0.75):
							middle_point = (upperleft + bottomright) / 2.0
							middle_point = middle_point + Vector3(rand_range(-h_dist,h_dist),0,rand_range(-h_dist,h_dist))
							var stoneInstance = stoneResource.instance()
							stoneInstance.translate(middle_point)
							prop.add_child(stoneInstance)
							stoneInstance.set_owner(prop)
		var packed_scene = PackedScene.new()
		packed_scene.pack(prop)
		ResourceSaver.save("res://prop.tscn", packed_scene)
		return prop;
