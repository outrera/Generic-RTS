extends VBoxContainer


var childs

var state = 0


func _ready():
	childs = get_children()
	pass

func _process(delta):
	if state == 0:
		for i in childs:
			i.hide()
		pass
	else:
		for i in childs:
			i.show()
		pass
	pass
