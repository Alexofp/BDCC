shader_type canvas_item;

uniform vec4 line_color : hint_color = vec4(1);
uniform float line_thickness : hint_range(0, 20) = 0.0;
uniform bool add_margins = true;

void vertex() {
    if (add_margins) {
        VERTEX += (UV * 2.0 - 1.0) * line_thickness;
    }
}

void fragment() {
    vec2 uv = UV;
    
    if (add_margins) {
        vec2 texture_pixel_size = vec2(1.0) / (vec2(1.0) / TEXTURE_PIXEL_SIZE + vec2(line_thickness * 2.0));
        
        uv = (uv - texture_pixel_size * line_thickness) * TEXTURE_PIXEL_SIZE / texture_pixel_size;
        
        if (uv != clamp(uv, vec2(0.0), vec2(1.0))) {
            COLOR.a = 0.0;
        } else {
            COLOR = texture(TEXTURE, uv);
        }
    } else {
        COLOR = texture(TEXTURE, uv);
    }
    
    vec2 size = TEXTURE_PIXEL_SIZE * line_thickness;
    
    if (line_thickness < 0.1) {
        vec4 color = texture(TEXTURE, uv);
        COLOR = color;
    } else {
        float outline = texture(TEXTURE, uv + vec2(-size.x, 0)).a;
        outline += texture(TEXTURE, uv + vec2(0, size.y)).a;
        outline += texture(TEXTURE, uv + vec2(size.x, 0)).a;
        outline += texture(TEXTURE, uv + vec2(0, -size.y)).a;
        outline += texture(TEXTURE, uv + vec2(-size.x * 0.866, size.y * 0.5)).a;
        outline += texture(TEXTURE, uv + vec2(-size.x * 0.5, size.y * 0.866)).a;
        outline += texture(TEXTURE, uv + vec2(size.x * 0.866, size.y * 0.5)).a;
        outline += texture(TEXTURE, uv + vec2(size.x * 0.5, size.y * 0.866)).a;
        outline += texture(TEXTURE, uv + vec2(-size.x * 0.866, -size.y * 0.5)).a;
        outline += texture(TEXTURE, uv + vec2(-size.x * 0.5, -size.y * 0.866)).a;
        outline += texture(TEXTURE, uv + vec2(size.x * 0.866, -size.y * 0.5)).a;
        outline += texture(TEXTURE, uv + vec2(size.x * 0.5, -size.y * 0.866)).a;
        outline = min(outline, 1.0);
        
        vec4 color = texture(TEXTURE, uv);
        COLOR = mix(color, line_color, outline - color.a);
    }
}