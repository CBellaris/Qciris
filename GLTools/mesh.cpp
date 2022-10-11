#include "mesh.h"
#include "vertexarray.h"
#include "vertexbuffer.h"
#include "indexbuffer.h"


#include <string>
#include <vector>



Mesh::Mesh():model(glm::mat4(1.0f)),pos(glm::vec3(0.0f)),angle(0.0f),
    axis(glm::vec3(1.0f,0.0f,0.0f)),scale(glm::vec3(1.0f)),firstset(1)
{

}

Mesh::~Mesh()
{
    glDeleteVertexArrays(1,&VAO);
}

void Mesh::PushMesh(vector<Vertex_M> vertices, vector<unsigned int> indices)
{
    this->vertices = vertices;
    this->indices = indices;
    setupMesh();
}



void Mesh::setupMesh()
{
    if(!firstset)
        glDeleteVertexArrays(1,&VAO);
    else
        firstset = !firstset;


    initializeOpenGLFunctions();
    VertexBuffer vb(&vertices[0], static_cast<unsigned int>(8 * vertices.size()));

    VertexArray va;

    VertexBufferLayout layout;
    layout.Push (3);
    layout.Push (3);
    layout.Push (2);
    va.AddBuffer(vb, layout);


    IndexBuffer ib(&indices[0], static_cast<unsigned int>(indices.size()));

    VAO = va.getRendererID();
    va.Unbind();
}

void Mesh::Draw(Shader *shader)
{
    initializeOpenGLFunctions();
    //setupMesh();

    shader->Bind();
    shader->SetUniformMatrix4f("model",model);

//    unsigned int diffuseNr = 1;
//    unsigned int specularNr = 1;
//    for (unsigned int i = 0; i < textures.size(); i++)
//    {
//        glActiveTexture(GL_TEXTURE0 + i);
//        // 获取纹理序号（diffuse_textureN 中的 N）
//        string number;
//        string name = textures[i].type;
//        if (name == "texture_diffuse")
//            number = std::to_string(diffuseNr++);
//        else if (name == "texture_specular")
//            number = std::to_string(specularNr++);

//        shader.SetUniform1i((name + number).c_str(), i);
//        glBindTexture(GL_TEXTURE_2D, textures[i].id);
//    }

    // 绘制网格
    glBindVertexArray(VAO);
    glDrawElements(GL_TRIANGLES, static_cast<unsigned int>(indices.size()), GL_UNSIGNED_INT, 0);
    glBindVertexArray(0);



}

void Mesh::setPosition(glm::vec3 pos)
{
    this->pos = pos;
    model = glm::mat4(1.0f);
    model = glm::translate(model,this->pos);
    model = glm::rotate(model,glm::radians(this->angle),this->axis);
    model = glm::scale(model,this->scale);

}

void Mesh::setRotate(float angle, glm::vec3 axis)
{
    this->angle = angle;
    this->axis = axis;

    model = glm::mat4(1.0f);
    model = glm::translate(model,this->pos);
    model = glm::rotate(model,glm::radians(this->angle),this->axis);
    model = glm::scale(model,this->scale);
}

void Mesh::setScale(glm::vec3 scale)
{
    this->scale = scale;

    model = glm::mat4(1.0f);
    model = glm::translate(model,this->pos);
    model = glm::rotate(model,glm::radians(this->angle),this->axis);
    model = glm::scale(model,this->scale);
}
