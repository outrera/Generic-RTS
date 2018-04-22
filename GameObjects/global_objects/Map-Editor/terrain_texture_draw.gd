extends TextureRect

var viewport_size 

func _ready():
	viewport_size = get_viewport_rect().size
	var bg = ImageTexture.new()
	var image = Image.new()
	
	image.create(viewport_size.x,viewport_size.y,false,Image.FORMAT_RGBA8)
	image.fill(Color(1,1,1,1))
	bg.create_from_image(image)
	self.texture = bg
	print(str(viewport_size.x) + "  " + str(viewport_size.y))
	
	pass

func _process(delta):
	
	if Input.is_action_pressed("click_left"):
		
		var image = self.texture.get_data()
		var mouse = get_viewport().get_mouse_position()
		
		image.lock()
		print("mouse x: "+ str(mouse.x) + "  mouse y: " + str(mouse.y) + " " + str(image.get_pixel(mouse.x, mouse.y)))
		
		for x in range(1,4):
			for y in range(1,4):
				image.set_pixel(mouse.x-2+x, mouse.y-2+y, Color(0, 0, 0))
		
		image.unlock()
		self.texture.set_data(image)
	
	pass
