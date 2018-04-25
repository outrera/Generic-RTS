shader_type canvas_item;

render_mode unshaded;

uniform sampler2D map;
uniform sampler2D map_squared;
uniform sampler2D map_fog_of_war;

void fragment()
{
	COLOR = texture(map,UV) * texture(map_fog_of_war,UV) * texture(map_squared,UV);
}