shader_type canvas_item;

render_mode unshaded;

uniform sampler2D minimap;


void fragment()
{
	COLOR = texture(minimap,UV);
}