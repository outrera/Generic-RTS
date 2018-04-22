extends Spatial

export (NodePath) var target

func _ready():
	pass

func _process(delta):
	var t = get_transform()
	var lookDir = get_node(target).get_transform().origin - t.origin
	var rotTransform = t.looking_at(get_transform().origin+lookDir*delta,Vector3(0,1,0))
	var thisRotation = Quat(rotTransform.basis)
	set_transform(Transform(thisRotation,t.origin))
	pass
