#version 330 core
out vec4 FragColor;

in vec2 TexCoord;

uniform sampler2D texture1;
uniform vec3 color;

void main()
{
    vec4 texColor = texture(texture1, TexCoord);

    if (color != vec3(0.0)) // If color is set, use it (for crosshair)
        FragColor = vec4(color, 1.0);
    else
        if(texColor.a < .1)
            discard;
        else
            FragColor = texture(texture1, TexCoord);
}