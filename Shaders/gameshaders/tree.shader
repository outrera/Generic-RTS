shader_type spatial;

uniform float YspeedMultiplier = 1.3;
uniform float YheightMultiplier = 0.23;

uniform float XspeedMultiplier = 1.8;
uniform float XheightMultiplier = 0.3;

uniform sampler2D albedo : hint_albedo;
uniform sampler2D normal : hint_normal;
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
	NORMALMAP = texture(normal,UV).xyz;
	NORMALMAP_DEPTH = 0.5;
	ROUGHNESS = 0.5;
}

