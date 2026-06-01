shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float opacity : hint_range(0.0, 1.0) = 1.0;

void fragment() {
    COLOR = texture(SCREEN_TEXTURE, SCREEN_UV);
    float avg = (COLOR.r + COLOR.g + COLOR.b) / 3.0;
    COLOR = vec4(vec3(avg), COLOR.a * opacity);
	
}