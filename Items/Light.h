#ifndef LIGHT_H
#define LIGHT_H
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <vector>
#include <string>

#include "GLTools/renderer.h"
#include "GLTools/shader.h"
#include "Geom/cube.h"

#include "Material/Material.h"

static const std::vector<std::string> LIGHT_UNIFORM {
    "position","dir","ambient","diffuse","specular","constant","linear","quadratic"
};

class Light : public QOpenGLExtraFunctions
{
private:
     string slot;
     int is_on;

     glm::vec3 position;
     glm::vec3 dir;
     float intensity;

     //attenuation
     float constant;
     float linear;
     float quadratic;

     //color and strengh
     glm::vec3 ambient;
     glm::vec3 diffuse;
     glm::vec3 specular;

     //visualize
     Cube light_visual;

     std::vector<glm::vec3> light_vec;
     std::vector<float> light_float;

     vector<Shader *> shader;
public:
     Material light_material;
public:
     Light()
     {  
         is_on = 1;
         initializeOpenGLFunctions();
         position = glm::vec3(2.0f,2.0f,2.0f);
         dir = glm::normalize(glm::vec3(-0.2f, -1.0f, -0.3f));
         intensity = 1.0f;
         constant = 1.0f;
         linear = 0.09f;
         quadratic = 0.032f;
         ambient = glm::vec3(0.05f, 0.05f, 0.05f);
         diffuse = glm::vec3(0.8f, 0.8f, 0.8f);
         specular = glm::vec3(1.0f, 1.0f, 1.0f);

         light_visual.setScale(glm::vec3(0.3f));
         light_visual.setPosition(position);

     }

     void setlightposition(glm::vec3 pos){
         position = pos;
         setLightShader();
         light_visual.setPosition(position);
     }

     void setlightIntensity(float intens){

         intensity = intens;
         setLightShader();
     }

     void lightVisual(){
         light_visual.Draw(light_material.shader);
     }

     void bindLightshader(Shader *shad , int slot){
         this->slot = slot+ "";
         shader.push_back(shad);
         setLightShader();

     }

     glm::vec3 getLightPosition(){
         return position;
     }
private:

     void setLightShader(){

         light_vec.clear();
         light_float.clear();

         if(light_vec.empty()){
         light_vec.push_back(position);
         light_vec.push_back(dir);
         light_vec.push_back(ambient*intensity);
         light_vec.push_back(diffuse*intensity);
         light_vec.push_back(specular*intensity);
         }

         if(light_float.empty()){
         light_float.push_back(constant);
         light_float.push_back(linear);
         light_float.push_back(quadratic);
         }

         for(auto iter = shader.begin();iter !=shader.end();iter++)
         {
            (*iter)->Bind();
            (*iter)->SetUniform1i(("pointLights["+ slot + "]." +"is_on").c_str(),is_on);
            for(int i = 0;i<5;i++)
                 (*iter)->SetUniform3fv(("pointLights["+ slot + "]." +LIGHT_UNIFORM[i]).c_str(),light_vec[i]);

            for(int i = 5;i<8;i++)
                 (*iter)->SetUniform1f(("pointLights["+ slot + "]." +LIGHT_UNIFORM[i]).c_str(),light_float[i-5]);
         }

     }

};

#endif // LIGHT_H
