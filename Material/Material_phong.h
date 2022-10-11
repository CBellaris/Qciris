#ifndef MATERIAL_PHONE_H
#define MATERIAL_PHONE_H
#include "Material/Material.h"

class Material_phong :public Material
{
public:
    Material_phong(){

        shader = new Shader("res/Shader/shader_phong.shader");

    }
};

#endif // MATERIAL_PHONE_H
