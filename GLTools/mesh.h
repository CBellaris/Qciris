#ifndef MESH_H
#define MESH_H
#include "renderer.h"
#include "shader.h"

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

using namespace std;

struct Vertex_M {
    glm::vec3 Position;
    glm::vec3 Normal;
    glm::vec2 TexCoords;
};


class Mesh : QOpenGLExtraFunctions
{
public:
    /*  网格数据  */
    vector<Vertex_M> vertices;
    vector<unsigned int> indices;

    /*  渲染数据  */
    unsigned int VAO;

    glm::mat4 model;

    /*  函数  */
    Mesh();
    ~Mesh();
    void PushMesh(vector<Vertex_M> vertices, vector<unsigned int> indices);
    virtual void Draw(Shader *shader);

    void setPosition(glm::vec3 pos);
    void setRotate(float angle,glm::vec3 axis = glm::vec3(1.0f,0.0f,0.0f));
    void setScale(glm::vec3 scale);
private:
    /*  函数  */
    void setupMesh();

    glm::vec3 pos;
    float angle;
    glm::vec3 axis;
    glm::vec3 scale;

    bool firstset;
};

#endif // MESH_H
