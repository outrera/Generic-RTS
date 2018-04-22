shader_type spatial;

render_mode blend_mix,depth_draw_always,cull_disabled,diffuse_burley,specular_schlick_ggx;

uniform float offset : hint_range(0.5,10.0);
uniform sampler2D splatmap;
uniform sampler2D normalmap : hint_normal;
uniform sampler2D metallic : hint_white;
uniform float metallic_value;

uniform sampler2D grass1 : hint_albedo;
uniform sampler2D grass2 : hint_albedo;
uniform sampler2D sand : hint_albedo;
uniform sampler2D dirt  : hint_albedo;
uniform sampler2D cliff1 : hint_albedo;
uniform sampler2D cliff2 : hint_albedo;
uniform sampler2D mountain_top : hint_albedo;

uniform vec4 metallic_texture_channel;

void fragment()
{
	float alpha = texture(splatmap,UV).a;
	
	if (alpha == alpha)
	{
		ALBEDO = texture(sand,UV*offset).rgb * alpha;
	}
	else if (alpha == alpha/4.0)
	{
		ALBEDO = texture(dirt,UV*offset).rgb * alpha;
	}
	else if (alpha == alpha/6.0)
	{
		ALBEDO = texture(grass1,UV*offset).rgb * alpha;
	}
	else if (alpha == alpha/3.0)
	{
		ALBEDO = texture(grass2,UV*offset).rgb * alpha;
	}
	else if(alpha == alpha/2.0)
	{
		ALBEDO = texture(cliff1,UV*offset).rgb * alpha;
	}
	else if (alpha == alpha/1.0)
	{
		ALBEDO = texture(cliff2,UV*offset).rgb * alpha;
	}
	else if (alpha == 0.0)
	{
		ALBEDO = texture(mountain_top,UV*offset).rgb * alpha;
	}
	else
	{
		ALBEDO = texture(grass1,UV*offset).rgb;
	}
	float metallic_tex = dot(texture(metallic,UV),metallic_texture_channel);
	METALLIC = metallic_tex * metallic_value;
	NORMALMAP = texture(normalmap,UV).xyz;
}

