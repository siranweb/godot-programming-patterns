shader_type canvas_item;

uniform float speed : hint_range(0.1, 10.0) = 2.0;
uniform float scale_amount : hint_range(0.0, 1.0) = 0.3;
uniform float rotation_amount : hint_range(0.0, 6.28) = 1.5;
uniform vec2 pivot = vec2(0.5);

void vertex() {
    float t = TIME * speed;
    float scale = 1.0 + sin(t) * scale_amount;
    float angle = sin(t * 0.7) * rotation_amount;

    float c = cos(angle);
    float s = sin(angle);
    mat2 rot = mat2(vec2(c, -s), vec2(s, c));

    vec2 pos = VERTEX - pivot;
    pos = rot * pos;
    pos *= scale;
    VERTEX = pos + pivot;
}