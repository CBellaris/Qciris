#Shader vertex
#version 330 core

layout(location = 0) in vec3 a_Pos;
layout(location = 1) in vec3 a_Normal;
layout(location = 2) in vec2 a_texCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

out vec3 v_Normal;
out vec3 v_fragPos;
out vec2 v_texCoord;
//out vec4 v_fragPosLight;

void main()
{
      gl_Position =  projection * view * model * vec4(a_Pos,1.0);

      v_Normal =  mat3(transpose(inverse(model))) * a_Normal;
      v_fragPos = vec3(model * vec4(a_Pos, 1.0));
      v_texCoord = a_texCoord;
     // v_fragPosLight = lightSpaceMatrix * vec4(v_fragPos, 1.0);

};


#Shader fragment
#version 330 core

out vec4 FragColor;

in vec3 v_Normal;
in vec3 v_fragPos;
in vec2 v_texCoord;
//in vec4 v_fragPosLight;

uniform vec3 u_viewPos;


struct PointLight {
        vec3 position;
        vec3 dir;

        float constant;
        float linear;
        float quadratic;

        vec3 ambient;
        vec3 diffuse;
        vec3 specular;
};


uniform PointLight pointLights;

vec3 CalcPointLight(PointLight light, vec3 normal, vec3 fragPos, vec3 viewDir);

void main()
{
            //法线与光线向量
            vec3 norm = normalize(v_Normal);
            vec3 viewDir = normalize(u_viewPos - v_fragPos);



            // 第一阶段：定向光照
            //vec3 result = CalcDirLight(dirLight, norm, viewDir);
            // 第二阶段：点光源
            vec3 result = CalcPointLight(pointLights, norm, v_fragPos, viewDir);
            // 第三阶段：聚光
            //result += CalcSpotLight(spotLight, norm, FragPos, viewDir);


            FragColor = vec4(result,1.0);

}

vec3 CalcPointLight(PointLight light, vec3 normal, vec3 fragPos, vec3 viewDir)
{
        vec3 lightDir = normalize(light.position - fragPos);
        // 漫反射着色
        float diff = max(dot(normal, lightDir), 0.0);
        // 镜面光着色
        vec3 halfwayDir = normalize(lightDir + viewDir);
        float spec = pow(max(dot(normal, halfwayDir), 0.0), 32.0);
        // 衰减
        float distance = length(light.position - fragPos);
        float attenuation = 1.0 / (light.constant + light.linear * distance +
                light.quadratic * (distance * distance));
        // 合并结果
        vec3 ambient = light.ambient * vec3(0.2,0.3,0.5);
        vec3 diffuse = light.diffuse * diff * vec3(0.2,0.3,0.5);
        vec3 specular = light.specular * spec * vec3(0.2,0.3,0.5);
        ambient *= attenuation;
        diffuse *= attenuation;
        specular *= attenuation;
        return (ambient + diffuse + specular);

}



