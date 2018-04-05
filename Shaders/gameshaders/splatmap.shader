shader_type spatial;

render_mode blend_mix;

uniform sampler2D splatmap;
uniform sampler2D tex1 : hint_albedo;
uniform sampler2D tex1Norm : hint_normal;
uniform sampler2D tex2 : hint_albedo;
uniform sampler2D tex2Norm : hint_normal;
uniform sampler2D tex3 : hint_albedo;
uniform sampler2D tex3Norm : hint_normal;
uniform float offset : hint_range(1.0,20.0);

void fragment()
{
	float red,green,blue;
	red = texture(splatmap,UV).r;
	green = texture(splatmap,UV).g;
	blue = texture(splatmap,UV).b;
	
	vec3 red_channel = texture(tex1,UV*offset).rgb * red;
	vec3 green_channel = texture(tex2,UV*offset).rgb * green;
	vec3 blue_channel = texture(tex3,UV*offset).rgb * blue;
	
	vec3 result = red_channel + green_channel + blue_channel;
	
	ALBEDO = result;
	NORMALMAP = texture(tex1,UV*offset).xyz + texture(tex2,UV*offset).xyz + texture(tex3,UV*offset).xyz;
	SPECULAR = red * green * blue;
}
