shader_type canvas_item;

render_mode unshaded;

uniform vec2 u_resolution;
uniform float u_time;


float plot(vec2 st, float pct)
{
	return smoothstep(pct-0.02,pct,st.y) - smoothstep(pct,pct+0.02,st.y);
}

void fragment()
{
	vec2 st = FRAGCOORD.xy/u_resolution;
	
	//float y = smoothstep(0.2,0.5,st.x) - smoothstep(0.5,0.8,st.x);
	float y = st.x;
	//float y = pow(st.x,5.0);
	
	vec3 color = vec3(y);
	
	//Plot line
	float pct = plot(st,y);
	
	color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);
	
	COLOR = vec4(color,1.0);
	
}