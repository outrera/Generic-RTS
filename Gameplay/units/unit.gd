extends KinematicBody


export (int,0,1) var unit_type = 0

var astar = AStar.new()# cuando termine toda la logica.

const MAX_SPEED = 50.0
const MIN_SPEED = 10.5

var selected = false

var land_navigation = get_parent().get_node("LandNavigation")
var water_navigation = get_parent().get_node("WaterNavigation")

var draw_path = false

var begin
var end

var path = []



func _ready():
	set_process_input(true)
	pass

func _physics_process(delta):
	
	if(path.size() > 1):
		var to_walk = delta*MIN_SPEED
		var to_watch = Vector3(0,1,0)
		while(to_walk > 0 and path.size() >= 2):
			var pfrom = path[path.size() - 2]
			var pto = path[path.size() - 2]
			
			to_watch = (pto - pfrom).normalized()
			var d = pfrom.distance_to(pto)
			if(d <= to_walk):
				path.remove(path.size()-1)
				to_walk -= d
			else:
				path[path.size() - 1] = pfrom.linear_interpolate(pto, to_walk/d)
				to_walk = 0
		var atpos = path[path.size() - 1]
		var atdir = to_watch
		atdir.y = 0
		
		var t = Transform()
		t.origin = atpos
		t=t.looking_at(atpos + atdir, Vector3(0, 1, 0))
		set_transform(t)
		
		if(path.size() < 2):
			path = []
			set_physics_process(false)
	else:
		set_physics_process(false)


func _input(event):
	if (event.is_class("InputEventMouseButton") and event.button_index == BUTTON_LEFT and event.pressed):
		var from = get_viewport().get_camera().project_ray_origin(event.position)
		var to = from + get_viewport().get_camera().project_ray_normal(event.position)*100
		var p = land_navigation.get_closest_point_to_segment(from, to)
		
		begin = land_navigation.get_closest_point(get_translation())
		end = p
		
	pass