extends Control

#Genera una imagen en blanco, para ahorrar espacio en el disco :)

const TEX_WIDTH = 500
const TEX_HEIGH = 500



func _ready():
	create_image()
	pass

func create_image():
	
	var img = Image.new()
	img.create(TEX_WIDTH,TEX_HEIGH,true,Image.FORMAT_RGB8)
	
	for i in img.get_width():
		for j in img.get_height():
			img.lock()
			img.set_pixel(i,j,Color(1,1,1))
			img.unlock()
	
	var tex = ImageTexture.new()
	tex.create_from_image(img)
	
	get_node("leyer1").texture = tex
	get_node("leyer2").texture = tex
	get_node("leyer3").texture = tex
	pass
