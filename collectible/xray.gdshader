shader_type spatial;
render_mode unshaded, depth_test_disabled;

uniform bool enabled = true;
uniform vec4 xray_color : source_color = vec4(0.0, 1.0, 1.0, 0.6);

void fragment() {
    if (!enabled) {
        discard;
    }
    ALBEDO = xray_color.rgb;
    ALPHA = xray_color.a;
}
