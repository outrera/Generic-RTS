tool
extends MeshInstance


export (Vector2) var terrain_size = Vector2(200,200)
export (float,0,60) var terrain_height = 0
export(float) 		var scaleFactor = 0.10
export(float)		var quadraticFactor = 0.09
export(float)		var matScaleFactor = 1.0

export (Texture) var heightmap
export (Texture) var splatmap
export (Texture) var grass1
export (Texture) var grass2
export (Texture) var sand
export (Texture) var dirt
export (Texture) var cliff1
export (Texture) var cliff2
export (Texture) var mountain_top

var terrain_material = preload("res://Materials/default_terrain.material")
var terrain_data = null

func quadratic_increase(x):
	var y = quadraticFactor*x*x + (1.0-quadraticFactor)*abs(x)
	if x < 0:
		y = -y
	return y

func _init():
	create_mesh()
	pass

func _ready():
	pass

func create_mesh():
	var mat = terrain_material
	var surface = SurfaceTool.new()
	var mesh = Mesh.new()
	surface.begin(Mesh.PRIMITIVE_TRIANGLES)
	
	for z in range(-terrain_size.x/2,terrain_size.x/2):
		for x in range(-terrain_size.y/2,terrain_size.y/2):
			var f_width = float(terrain_size.y)
			
			var coord_ul = Vector2(quadratic_increase(x),quadratic_increase(z))
			var coord_ur = Vector2(quadratic_increase(x+1),quadratic_increase(z))
			var coord_lr = Vector2(quadratic_increase(x+1), quadratic_increase(z+1))
			var coord_ll = Vector2(quadratic_increase(x),quadratic_increase(z+1))
			
			var uv_ul = (coord_ul / f_width + Vector2(0.5, 0.5)) * matScaleFactor
			var vert_ul = Vector3(coord_ul.x, 0, coord_ul.y) * scaleFactor
			
			var uv_ur = (coord_ur / f_width + Vector2(0.5, 0.5)) * matScaleFactor
			var vert_ur = Vector3(coord_ur.x, 0, coord_ur.y) * scaleFactor
			
			var uv_lr = (coord_lr / f_width + Vector2(0.5, 0.5)) * matScaleFactor
			var vert_lr = Vector3(coord_lr.x, 0, coord_lr.y) * scaleFactor
			
			var uv_ll = (coord_ll / f_width + Vector2(0.5, 0.5)) * matScaleFactor
			var vert_ll = Vector3(coord_ll.x, 0, coord_ll.y) * scaleFactor
			
			surface.add_uv(uv_ul)
			surface.add_vertex(vert_ul)
			surface.add_uv(uv_ur)
			surface.add_vertex(vert_ur)
			surface.add_uv(uv_lr)
			surface.add_vertex(vert_lr)
			
			surface.add_uv(uv_lr)
			surface.add_vertex(vert_lr)
			surface.add_uv(uv_ll)
			surface.add_vertex(vert_ll)
			surface.add_uv(uv_ul)
			surface.add_vertex(vert_ul)
	
	surface.generate_normals()
	surface.index()
	
	surface.commit(mesh)
	surface.set_material(mat)
	
	self.set_mesh(mesh)
	self.set_surface_material(0, mat)
	mat.set_shader_param("splatmap",splatmap)
	mat.set_shader_param("grass1",grass1)
	mat.set_shader_param("grass2",grass2)
	mat.set_shader_param("sand",sand)
	mat.set_shader_param("dirt",dirt)
	mat.set_shader_param("cliff1",cliff1)
	mat.set_shader_param("cliff2",cliff2)
	mat.set_shader_param("mountain_top",mountain_top)
	pass

func create_collision():
	create_trimesh_collision()
	pass
