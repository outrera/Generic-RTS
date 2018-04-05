shader_type spatial;

render_mode blend_mix,specular_phong,diffuse_lambert,depth_draw_always;

uniform sampler2D splatmap : hint_albedo;
//Textura de pasto:
uniform sampler2D grass1 : hint_albedo;
uniform sampler2D grass1Norm : hint_normal;
uniform sampler2D grass2 : hint_albedo;
uniform sampler2D grass2Norm : hint_normal;
uniform sampler2D grass3 : hint_albedo;
uniform sampler2D grass3Norm : hint_normal;
//Fin textura de pasto;
//Textura de acantilados:
uniform sampler2D cliff1 : hint_albedo;
uniform sampler2D cliff1Normal : hint_normal;
uniform sampler2D cliff2 : hint_albedo;
uniform sampler2D cliff2Normal : hint_normal;
uniform sampler2D cliff3 : hint_albedo;
uniform sampler2D cliff3Normal : hint_normal;
//Fin textura acantilados;
//Textura de desierto/suciedad:
uniform sampler2D dirt1 : hint_albedo;
uniform sampler2D dirt1Normal : hint_normal;
uniform sampler2D dirt2 : hint_albedo;
uniform sampler2D dirt2Normal : hint_normal;
uniform sampler2D dirt3 : hint_albedo;
uniform sampler2D dirt3Normal : hint_normal;
//Fin de textura de desierto/suciedad;
uniform float offset = 20;

void fragment()
{
	float red,green,blue;
	red = texture(splatmap,UV).r;
	green = texture(splatmap,UV).g;
	blue = texture(splatmap,UV).b;
	
	
	vec3 red_channel;
	vec3 green_channel;
	vec3 blue_channel;
	
	if(red > 0.5)
	{
		red_channel = texture(grass1,UV*offset).rgb * red;
	}
	else if (red <= 0.5)
	{
		red_channel = texture(grass2,UV*offset).rgb * red;
	}
	else if(red == 1.0)
	{
		red_channel = texture(grass3,UV*offset).rgb * red;
	}
	
	if(green > 0.5)
	{
		green_channel = texture(cliff1,UV*offset).rgb * green;
	}
	else if(green <= 0.5)
	{
		green_channel = texture(cliff2,UV*offset).rgb * green;
	}
	else if(green == 1.0)
	{
		green_channel = texture(cliff2,UV*offset).rgb * green;
	}
	
	if(blue > 0.5)
	{
		blue_channel = texture(dirt1,UV*offset).rgb * blue;
	}
	else if(blue <= 0.5)
	{
		blue_channel = texture(dirt2,UV*offset).rgb * blue;
	}
	else if(blue == 1.0)
	{
		blue_channel = texture(dirt3,UV*offset).rgb * blue;
	}
	
	vec3 result = red_channel + green_channel + blue_channel;
	
	ALBEDO = result;
	SPECULAR = red * green * blue;
}

