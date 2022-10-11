#ifndef MESH_TEX_H
#define MESH_TEX_H
#include "renderer.h"
#include "shader.h"

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include <string>
#include <vector>
using namespace std;


struct Vertex {
    glm::vec3 Position;
    glm::vec3 Normal;
    glm::vec2 TexCoords;
};

struct MeshTexture {
    unsigned int id;
    string type;
    string path;
};

class Mesh_tex : public QOpenGLExtraFunctions{
public:
    /*  网格数据  */
    vector<Vertex> vertices;
    vector<unsigned int> indices;
    vector<MeshTexture> textures;

    /*  渲染数据  */
    unsigned int VAO;

    /*  函数  */
    Mesh_tex(vector<Vertex> vertices, vector<unsigned int> indices, vector<MeshTexture> textures);
    void Draw(Shader *shader);

    void setModelMatrix(glm::mat4 model);

private:
    unsigned int VBO, EBO;

    glm::mat4 model;


    /*  函数  */
    void setupMesh();
};

#endif // MESH_TEX_H
