#ifndef SCENE_H
#define SCENE_H
#include "GLTools/Camera.h"
#include "GLTools/mesh.h"

#include "Items/Light.h"
#include "Geom/cube.h"
#include "Geom/plane.h"
#include "Geom/model.h"
//#include "Material/Material_phong_shadow.h"
#include "Material/Material_phong_tex.h"


const int LIGHT_COUNT = 20;

class Scene : public QOpenGLExtraFunctions
{
public:
    Scene(){
       initializeOpenGLFunctions();
       Light* light0 = new Light;
       light0->setlightIntensity(2.0f);
       light.push_back(light0);

//       Light* light1 = new Light;
//       light1 ->setlightposition(glm::vec3(2.0f,2.0f,-2.0f));
//       light.push_back(light1);

       material = new Material_phong_tex;

       light[0]->bindLightshader(material->shader,0);
       //light[1]->bindLightshader(material->shader,1);

       PushGeom(Scene::PLANE);
       //PushGeom(Scene::CUBE);



       model = new Model("res/nonasuit/nanosuit.obj");
       model->setScale(glm::vec3(0.5));
       model->setPosition(glm::vec3(0.0f,-1.0f,0.0f));
       processDepthCubeMap();
       material->Bind();

    }


    enum GEOM{CUBE,PLANE,SPHERE};

    Camera camera;
    vector<Light *> light;

    Material_phong_tex *material;
private:
    vector<Mesh *> mesh;
    vector<GEOM> geom;
    Model *model;


    int SCR_HEIGHT;
    int SCR_WIDTH;


public:

    void PushGeom(GEOM geo){

        if(geo == CUBE){
           Cube *cube0 = new Cube;
           cube0->setRotate(geom.size() * 10.0f);
           mesh.push_back(reinterpret_cast<Mesh *>(cube0));
        }

        if(geo == PLANE){
           Plane *plane0 = new Plane;
           if(count(geom.begin(),geom.end(),PLANE) == 0){
               plane0 ->setPosition(glm::vec3(0.0f,-1.5f,0.0f));
               plane0 ->setScale(glm::vec3(6.0f));
           }
           mesh.push_back(reinterpret_cast<Mesh *>(plane0));
        }



        geom.push_back(geo);

    }

    void resize(int w,int h){
        SCR_WIDTH = w;
        SCR_HEIGHT = h;
    }

    void drawScene(){

        glm::mat4 projection = glm::perspective(glm::radians(camera.Zoom), (float)SCR_WIDTH / (float)SCR_HEIGHT, 0.1f, 100.0f);
        glm::mat4 view = camera.GetViewMatrix();
        camera.ProcessKeyboard(0.1f); //帧处理速度

        material->shader->Bind();
        material->shader->SetUniformMatrix4f("view",view);
        material->shader->SetUniformMatrix4f("projection",projection);
        material->shader->SetUniform3fv("u_viewPos", camera.Position);

        light[0]->light_material.shader->Bind();
        light[0]->light_material.shader->SetUniformMatrix4f("view",view);
        light[0]->light_material.shader->SetUniformMatrix4f("projection",projection);


        //绘制物体
        for(auto iter = mesh.begin();iter != mesh.end();iter++)
            {
                  (*iter)->Draw(material->shader);
            }

        //绘制模型
        model->Draw(material->shader);

        light[0] ->lightVisual();
    }

    void drawSceneNoVisual(Shader *shader){
        for(auto iter = mesh.begin();iter != mesh.end();iter++)
                  (*iter)->Draw(shader);
        model->Draw(shader);
    }

    inline  int getLightNumber(){
        return static_cast<int>(light.size());
    }

    //为每个灯生成立方体阴影贴图
    void processDepthCubeMap(){
        for(int i = material->depthCubemap.size(); i < getLightNumber();i++)
            material->depthCubemap.push_back(material->genDepthCubeMap());

        for(unsigned long long i = 0;i<material->depthCubemap.size();i++){
            glm::vec3 light_position = light[i]->getLightPosition();

            glBindFramebuffer(GL_FRAMEBUFFER, material->depthMapFBO);
            glFramebufferTexture(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, material->depthCubemap[i], 0);
            if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE)
                    std::cout << "Framebuffer not complete!" << std::endl;

            std::vector<glm::mat4> shadowTransforms;
            shadowTransforms.push_back(material->shadowProj * glm::lookAt(light_position, light_position + glm::vec3( 1.0,  0.0,  0.0), glm::vec3(0.0, -1.0,  0.0)));
            shadowTransforms.push_back(material->shadowProj * glm::lookAt(light_position, light_position + glm::vec3(-1.0,  0.0,  0.0), glm::vec3(0.0, -1.0,  0.0)));
            shadowTransforms.push_back(material->shadowProj * glm::lookAt(light_position, light_position + glm::vec3( 0.0,  1.0,  0.0), glm::vec3(0.0,  0.0,  1.0)));
            shadowTransforms.push_back(material->shadowProj * glm::lookAt(light_position, light_position + glm::vec3( 0.0, -1.0,  0.0), glm::vec3(0.0,  0.0, -1.0)));
            shadowTransforms.push_back(material->shadowProj * glm::lookAt(light_position, light_position + glm::vec3( 0.0,  0.0,  1.0), glm::vec3(0.0, -1.0,  0.0)));
            shadowTransforms.push_back(material->shadowProj * glm::lookAt(light_position, light_position + glm::vec3( 0.0,  0.0, -1.0), glm::vec3(0.0, -1.0,  0.0)));

            glViewport(0, 0, SHADOW_WIDTH, SHADOW_WIDTH);
            glClearColor(1.0f,1.0f,1.0f,1.0f);
            glClear(GL_COLOR_BUFFER_BIT);
            material->shadow_mapping->Bind();
            for (GLuint i = 0; i < 6; ++i)
                material->shadow_mapping->SetUniformMatrix4f(("shadowMatrices[" + std::to_string(i) + "]").c_str(),shadowTransforms[i]);
            material->shadow_mapping->SetUniform1f("far_plane",FAR_DEFAULT);
            material->shadow_mapping->SetUniform3fv("lightPos",light_position);
            drawSceneNoVisual(material->shadow_mapping);
            glBindFramebuffer(GL_FRAMEBUFFER, 0);

        }

    }

};


#endif // SCENE_H
