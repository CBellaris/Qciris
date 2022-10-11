#Shader vertex
#version 330 core

layout(location = 0) in vec3 a_Pos;
layout(location = 1) in vec3 a_Normal;
layout(location = 2) in vec2 a_texCoord;

out vec3 v_Normal;
out vec3 v_fragPos;
out vec2 v_texCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
        gl_Position = projection * view * model * vec4(a_Pos, 1.0);

        //传递数据至fs
        v_Normal = mat3(transpose(inverse(model))) * a_Normal;
        v_fragPos = vec3(model * vec4(a_Pos, 1.0));
        v_texCoord = a_texCoord;

};


#Shader fragment
#version 330 core

out vec4 FragColor;

//接受vs传来的数据

in vec3 v_Normal;
in vec3 v_fragPos;
in vec2 v_texCoord;

uniform vec3 u_viewPos;
uniform float far_plane;


//材质所需变量
//struct Material {
//        sampler2D diffuse;
//        sampler2D specular;
//};
//uniform Material material;
uniform sampler2D texture_diffuse1;
uniform sampler2D texture_specular1;
uniform sampler2D texture_normal1;

uniform samplerCube depthMap;

//灯光
//平行光
//struct DirLight {
//	vec3 direction;

//	vec3 ambient;
//	vec3 diffuse;
//	vec3 specular;
//};
//uniform DirLight dirLight;
//vec3 CalcDirLight(DirLight light, vec3 normal, vec3 viewDir);

//点光源
struct PointLight {
        int is_on;

        vec3 position;
        vec3 dir;

        float constant;
        float linear;
        float quadratic;

        vec3 ambient;
        vec3 diffuse;
        vec3 specular;


};

#define NR_POINT_LIGHTS 10
uniform PointLight pointLights[NR_POINT_LIGHTS];

const uint SAMPLE_COUNT = 64u;

//函数声明
vec3 CalcPointLight(PointLight light, vec3 normal, vec3 fragPos, vec3 viewDir);

float ShadowCalculation(vec3 fragToLight);
vec2 PoissonDisk(int samplecount, float radius);
vec3 GGXSample(uint count,vec3 N, float roughness);
vec3 ImportanceSampleGGX(vec2 Xi, vec3 N, float roughness);

vec3 sampleOffsetDirections[20] = vec3[]
(
   vec3( 1,  1,  1), vec3( 1, -1,  1), vec3(-1, -1,  1), vec3(-1,  1,  1),
   vec3( 1,  1, -1), vec3( 1, -1, -1), vec3(-1, -1, -1), vec3(-1,  1, -1),
   vec3( 1,  1,  0), vec3( 1, -1,  0), vec3(-1, -1,  0), vec3(-1,  1,  0),
   vec3( 1,  0,  1), vec3(-1,  0,  1), vec3( 1,  0, -1), vec3(-1,  0, -1),
   vec3( 0,  1,  1), vec3( 0, -1,  1), vec3( 0, -1, -1), vec3( 0,  1, -1)
);

void main()
{


        //法线与光线向量
        vec3 norm = normalize(v_Normal);
        vec3 viewDir = normalize(u_viewPos - v_fragPos);

        vec3 result = vec3(0.0);
        // 第二阶段：点光源
        for(int i = 0;i < NR_POINT_LIGHTS;i++){
            if(pointLights[i].is_on == 1)
                 result += CalcPointLight(pointLights[i], norm, v_fragPos, viewDir);
        }
        FragColor = vec4(result, 1.0);
        //FragColor = vec4(vec3(texture(depthMap, v_fragPos - pointLights.position ).r), 1.0);

}



//定义函数

vec3 CalcPointLight(PointLight light, vec3 normal, vec3 fragPos, vec3 viewDir)
{
        vec3 fragToLight = fragPos - light.position;

        float shadow = ShadowCalculation(fragToLight) ;

        vec3 lightDir = normalize(light.position - fragPos);
        // 漫反射着色
        float diff = max(dot(normal, lightDir), 0.0);
        // 镜面光着色
        vec3 halfwayDir = normalize(lightDir + viewDir);
        float spec = pow(max(dot(normal, halfwayDir), 0.0), 32);
        // 衰减
        float distance = length(light.position - fragPos);
        float attenuation = 1.0 / (light.constant + light.linear * distance +
                light.quadratic * (distance * distance));
        // 合并结果
        vec3 ambient = light.ambient * vec3(texture(texture_diffuse1,v_texCoord));
        vec3 diffuse = shadow * light.diffuse * diff * vec3(texture(texture_diffuse1,v_texCoord));
        vec3 specular = shadow * light.specular * spec * vec3(texture(texture_specular1,v_texCoord));
        ambient *= attenuation;
        diffuse *= attenuation;
        specular *= attenuation;
        return (ambient + diffuse + specular);

}

float ShadowCalculation(vec3 fragToLight)
{
        float currentDepth = length(fragToLight);
        float shadow = 0.0;
        float blockerdepth = 0.0;
        int blockercount = 0;
        float diskRadius = 0.06;

        for (int i = 0; i < 20; i++)
        {
                if (currentDepth < far_plane)
                {
                        float Depth = far_plane * texture(depthMap, fragToLight + sampleOffsetDirections[i] * diskRadius).r;
                        if (currentDepth - 0.15 > Depth)
                        {
                                blockerdepth += Depth;
                                blockercount ++;
                        }
                }
        }

        blockerdepth /= blockercount;
        if(blockercount == 0)
            blockerdepth = currentDepth;

        diskRadius = 0.1 * (currentDepth/blockerdepth - 1); //半影范围 = 光源大小 * (接受物距离 - 遮挡物距离)/遮挡物距离  (相较于光源)

        for (int i = 0; i < 20; i++)
        {
                if (currentDepth > far_plane)
                        shadow += 1.0;
                else{
                         float Depth = far_plane * texture(depthMap,fragToLight + sampleOffsetDirections[i] * diskRadius).r;
                         shadow += currentDepth - 0.15 > Depth ? 0.0 : 1.0;
                }


        }

        shadow /= 20;

        return shadow;
}

vec2 PoissonDisk(int samplecount,float radius)
{
        const float PI = 3.141592653589793;
        const float PI2 = 6.283185307179586;

        int NUM_SAMPLE = 100;
        int NUM_RING = 5;

        float ANGLE_STEP = PI2 * NUM_RING / NUM_SAMPLE;
        float RADIUS_STEP = radius / NUM_SAMPLE;
        float angle = 0.0;

        float x = cos(angle * ANGLE_STEP * samplecount) * RADIUS_STEP * (samplecount + 1);
        float y = sin(angle * ANGLE_STEP * samplecount) * RADIUS_STEP * (samplecount + 1);

        return vec2(x, y);
}

float RadicalInverse_VdC(uint bits)
{
    bits = (bits << 16u) | (bits >> 16u);
    bits = ((bits & 0x55555555u) << 1u) | ((bits & 0xAAAAAAAAu) >> 1u);
    bits = ((bits & 0x33333333u) << 2u) | ((bits & 0xCCCCCCCCu) >> 2u);
    bits = ((bits & 0x0F0F0F0Fu) << 4u) | ((bits & 0xF0F0F0F0u) >> 4u);
    bits = ((bits & 0x00FF00FFu) << 8u) | ((bits & 0xFF00FF00u) >> 8u);
    return float(bits) * 2.3283064365386963e-10; // / 0x100000000
}

vec2 Hammersley(uint i, uint N)
{
    return vec2(float(i)/float(N), RadicalInverse_VdC(i));
}

vec3 GGXSample(uint count,vec3 N, float roughness)
{
    vec2 pyi = Hammersley(count, SAMPLE_COUNT);
    return ImportanceSampleGGX(pyi,N,roughness);
}

vec3 ImportanceSampleGGX(vec2 Xi, vec3 N, float roughness)
{
    const float PI = 3.141592653589793;

    float a = roughness*roughness;

    float phi = 2.0 * PI * Xi.x;
    float cosTheta = sqrt((1.0 - Xi.y) / (1.0 + (a*a - 1.0) * Xi.y));
    float sinTheta = sqrt(1.0 - cosTheta*cosTheta);

    // from spherical coordinates to cartesian coordinates
    vec3 H;
    H.x = cos(phi) * sinTheta;
    H.y = sin(phi) * sinTheta;
    H.z = cosTheta;

    // from tangent-space vector to world-space sample vector
    vec3 up        = abs(N.z) < 0.999 ? vec3(0.0, 0.0, 1.0) : vec3(1.0, 0.0, 0.0);
    vec3 tangent   = normalize(cross(up, N));
    vec3 bitangent = cross(N, tangent);

    vec3 sampleVec = tangent * H.x + bitangent * H.y + N * H.z;
    return normalize(sampleVec);
}

