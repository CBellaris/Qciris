#Shader vertex
#version 330 core

layout(location = 0) in vec3 a_Pos;
layout(location = 1) in vec3 a_Normal;
layout(location = 2) in vec2 a_texCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
      gl_Position =  projection * view * model * vec4(a_Pos,1.0);

};


#Shader fragment
#version 330 core

out vec4 FragColor;

uniform vec4 color;

void main()
{

        FragColor = color;

}





