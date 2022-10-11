#ifndef MATERIAL_H
#define MATERIAL_H
#include "GLTools/shader.h"
#include "Items/Light.h"

#include <Include/glm/glm.hpp>
#include <Include/glm/gtc/matrix_transform.hpp>
#include <Include/glm/gtc/type_ptr.hpp>

class Material
{
public:
    Material():color(glm::vec4(1.0f,1.0f,1.0f,1.0f)){

        shader = new Shader("res/Shader/shader_default.shader");
        shader->Bind();
        shader->SetUniform4f("color",color.x,color.y,color.z,color.w);
    }

    ~Material(){
        delete shader;
    }

    Shader *shader;


private:
    glm::vec4 color;


};

#endif // MATERIAL_H
