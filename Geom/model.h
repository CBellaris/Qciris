#ifndef MODEL_H
#define MODEL_H
#include "glm/glm.hpp"
#include "glm/gtc/matrix_transform.hpp"
#include "stb_image.h"
#include "assimp/Importer.hpp"
#include "assimp/scene.h"
#include "assimp/postprocess.h"

#include "GLTools/mesh_tex.h"
#include "GLTools/shader.h"

#include <string>
#include <fstream>
#include <sstream>
#include <iostream>
#include <map>
#include <vector>
using namespace std;

class Model : QOpenGLExtraFunctions
{
public:
    // model data
    vector<MeshTexture> textures_loaded;	// stores all the textures loaded so far, optimization to make sure textures aren't loaded more than once.
    vector<Mesh_tex>    meshes;
    string directory;
    bool gammaCorrection;

    Model(string const& path, bool gamma = false) : gammaCorrection(gamma),
        pos(glm::vec3(0.0f)),angle(0.0f),
        axis(glm::vec3(1.0f,0.0f,0.0f)),scale(glm::vec3(1.0f)),
        model(glm::mat4(1.0f))
    {
        initializeOpenGLFunctions();
        loadModel(path);
        passModelMatrix();
    }

    void Draw(Shader *shader)
    {
        for (unsigned int i = 0; i < meshes.size(); i++)
            meshes[i].Draw(shader);
    }

    void setPosition(glm::vec3 pos);
    void setRotate(float angle,glm::vec3 axis = glm::vec3(1.0f,0.0f,0.0f));
    void setScale(glm::vec3 scale);


private:
    void loadModel(string const& path);
    void processNode(aiNode* node, const aiScene* scene);
    Mesh_tex processMesh(aiMesh* mesh, const aiScene* scene);
    vector<MeshTexture> loadMaterialTextures(aiMaterial* mat, aiTextureType type, string typeName);
    unsigned int TextureFromFile(const char* path, const string& directory);
    void passModelMatrix(){
         for (unsigned int i = 0; i < meshes.size(); i++)
             meshes[i].setModelMatrix(model);
    }

    glm::vec3 pos;
    float angle;
    glm::vec3 axis;
    glm::vec3 scale;
    glm::mat4 model;

};
#endif // MODEL_H
