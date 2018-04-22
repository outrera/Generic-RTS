shader_type canvas_item;
render_mode blend_mul;
uniform sampler2D layer_1;
uniform sampler2D layer_2;
uniform sampler2D layer_3;


void fragment()
{
	COLOR = texture(layer_1,UV).rgba + texture(layer_2,UV).rgba + texture(layer_3,UV).rgba;
}