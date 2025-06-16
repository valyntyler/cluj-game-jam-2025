shader_type canvas_item;

uniform sampler2D screen_texture:hint_screen_texture,repeat_disable,filter_nearest;

uniform float number_of_colors;

void fragment() {
    vec3 color = texture(screen_texture, SCREEN_UV).rgb;
    
    COLOR.rgb = color;
}
