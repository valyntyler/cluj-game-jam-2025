shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture,filter_linear;
uniform float offset = 1.0f;

uniform vec2 offset_r;
uniform vec2 offset_g;
uniform vec2 offset_b;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 uv_r =SCREEN_UV+ SCREEN_PIXEL_SIZE * offset_r;
	vec2 uv_g =SCREEN_UV+ SCREEN_PIXEL_SIZE * offset_g;
	vec2 uv_b =SCREEN_UV+ SCREEN_PIXEL_SIZE * offset_b;

	vec4 channel_r = texture(SCREEN_TEXTURE, uv_r);
	vec4 channel_g = texture(SCREEN_TEXTURE, uv_g);
	vec4 channel_b = texture(SCREEN_TEXTURE, uv_b);

	COLOR = vec4(channel_r.r, channel_g.g, channel_b.b, 1.0f);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
