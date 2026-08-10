shader_type canvas_item;
uniform float pixel_size : hint_range(1.0, 100.0) = 10.0;

void fragment() {
    vec2 size = 1.0 / TEXTURE_PIXEL_SIZE;
    vec2 ps = vec2(pixel_size);
    vec2 uv = floor(UV * size / ps) * ps / size;
    
    
    vec4 tex_color = texture(TEXTURE, uv);
    
    COLOR = tex_color * COLOR;
}
