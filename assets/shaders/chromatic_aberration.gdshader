shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture,filter_linear;
uniform float offset = 1.0f;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 uv = SCREEN_UV;

	vec4 channel_r = texture(SCREEN_TEXTURE, uv);
	vec4 channel_g = texture(SCREEN_TEXTURE, vec2(uv.x + (offset * SCREEN_PIXEL_SIZE.x), uv.y));
	vec4 channel_b = texture(SCREEN_TEXTURE, uv);

	COLOR = vec4(channel_r.r, channel_g.g, channel_b.b, 1.0f);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
