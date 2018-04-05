shader_type spatial;

render_mode vertex_lighting,depth_draw_alpha_prepass;

uniform float YspeedMultiplier = 1.3;
uniform float YheightMultiplier = 0.23;

uniform float XspeedMultiplier = 1.8;
uniform float XheightMultiplier = 0.3;

uniform sampler2D albedo : hint_albedo;
uniform sampler2D normal : hint_normal;
uniform sampler2D emission : hint_white;
uniform vec4 emission_color: hint_color;
uniform float energy : hint_range(0,5);
varying vec4 vertexColor;

void vertex()
{
	vertexColor = COLOR;
	VERTEX.x += XheightMultiplier * sin(TIME*YspeedMultiplier*vertexColor.r);
	VERTEX.y += YheightMultiplier * sin(TIME*XspeedMultiplier*vertexColor.r);
}

void fragment()
{
	ALBEDO = texture(albedo,UV).rgb;
	ALPHA = texture(albedo,UV).a;
	NORMALMAP = texture(normal,UV).xyz;
	NORMALMAP_DEPTH = 0.5;
	ROUGHNESS = 0.5;
}

void light()
{
	DIFFUSE_LIGHT = emission_color.rgb;
}
