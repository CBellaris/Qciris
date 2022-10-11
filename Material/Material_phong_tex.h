#ifndef MATERIAL_PHONE_SHADOW_H
#define MATERIAL_PHONE_SHADOW_H

#include "Material/Material.h"
#include "GLTools/texture.h"

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include <QOpenGLExtraFunctions>

//透视矩阵的远近平面距离
static const float NEAR_DEFAULT = 0.5f;
static const float FAR_DEFAULT = 25.0f;
//阴影贴图分辨率
static const GLuint SHADOW_WIDTH = 2048;

class Material_phong_tex : public Material , QOpenGLExtraFunctions
{
public:
    Material_phong_tex() {
        initializeOpenGLFunctions();
        shadow_mapping = new Shader("res/Shader/shader_shadowmapping.shader");
        shader = new Shader("res/Shader/shader_phong_tex.shader");

//        diffuse = new Texture("res/diffuse.jpg");
//        specular = new Texture("res/specular.jpg");

        shader->Bind();
        shader->SetUniform1f("far_plane",FAR_DEFAULT);

        //每个灯通用透视矩阵
        shadowProj = glm::perspective(glm::radians(90.0f), 1.0f, NEAR_DEFAULT, FAR_DEFAULT);
        //通用帧缓存
        glGenFramebuffers(1, &depthMapFBO);


    }

    ~Material_phong_tex(){
        delete shadow_mapping;
    }

    void Bind(){
        //设定shader
        shader->Bind();
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_CUBE_MAP,depthCubemap[0]);
        shader->SetUniform1i("depthMap",0);
//        diffuse->Bind(1);
//        specular->Bind(2);
//        shader->SetUniform1i("material.diffuse",1);
//        shader->SetUniform1i("material.specular",2);


    }


    Shader *shadow_mapping;

    glm::mat4 shadowProj;
    GLuint depthMapFBO;
    std::vector <GLuint> depthCubemap;

//    Texture *diffuse;
//    Texture *specular;




    //生成立方体阴影贴图
    GLuint genDepthCubeMap(){
        GLuint depthCubemap;
        glGenTextures(1, &depthCubemap);
        glBindTexture(GL_TEXTURE_CUBE_MAP, depthCubemap);
        for (GLuint i = 0; i < 6; ++i)
            glTexImage2D(GL_TEXTURE_CUBE_MAP_POSITIVE_X + i, 0, GL_RGB16F, SHADOW_WIDTH, SHADOW_WIDTH, 0, GL_RGB, GL_FLOAT, NULL);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_EDGE);
        return depthCubemap;
    }
};

#endif // MATERIAL_PHONE_SHADOW_H
