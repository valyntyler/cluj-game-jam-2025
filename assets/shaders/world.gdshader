shader_type canvas_item;

uniform sampler2D screen_texture:hint_screen_texture,repeat_disable,filter_nearest;

uniform float number_of_colors;

void fragment() {
    vec3 color = texture(screen_texture, SCREEN_UV).rgb;

		color.r = floor(color.r * number_of_colors) / number_of_colors;
		color.g = floor(color.g * number_of_colors) / number_of_colors;
		color.b = floor(color.b * number_of_colors) / number_of_colors;
    
    COLOR.rgb = color;
}
