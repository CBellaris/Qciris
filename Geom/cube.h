#ifndef CUBE_H
#define CUBE_H

#include "GLTools/mesh.h"

class Cube : public Mesh
{
public:
    Cube(): lenght(1.0f),width(1.0f),height(1.0f)
    {
        genMesh();
    }

    void reset(float lenght)
    {
        this->lenght = lenght;
        this->width = lenght;
        this->height = lenght;
        genMesh();
    }


private:
    float lenght;
    float width;
    float height;

    vector<Vertex_M> cube;
    vector<unsigned int> index;

    void genMesh()
    {
        Vertex_M point1 = {glm::vec3( lenght/2, width/2,-height/2),glm::vec3(0.0f,1.0f,0.0f),glm::vec2(1.0f,0.0f)};
        Vertex_M point2 = {glm::vec3( lenght/2, width/2, height/2),glm::vec3(0.0f,1.0f,0.0f),glm::vec2(1.0f,1.0f)};
        Vertex_M point3 = {glm::vec3(-lenght/2, width/2, height/2),glm::vec3(0.0f,1.0f,0.0f),glm::vec2(0.0f,1.0f)};
        Vertex_M point4 = {glm::vec3(-lenght/2, width/2,-height/2),glm::vec3(0.0f,1.0f,0.0f),glm::vec2(0.0f,0.0f)};

        vector<Vertex_M> face;
        face.push_back(point1);
        face.push_back(point2);
        face.push_back(point3);
        face.push_back(point1);
        face.push_back(point3);
        face.push_back(point4);

        cube.clear();

        for(int i = 0;i< 6;i++){
            cube.push_back(face[i]);
        }

        for(int i = 0;i< 6;i++){
            glm::mat4 rotate = glm::mat4(1.0f);
            rotate = glm::rotate(rotate, glm::radians(90.0f), glm::vec3(1.0f, 0.0f, 0.0f));
            Vertex_M point = {glm::vec3(rotate*glm::vec4(face[i].Position,1.0f)),glm::vec3(rotate*glm::vec4(face[i].Normal,1.0f)),face[i].TexCoords};
            cube.push_back(point);
        }


        for(int i = 0;i< 6;i++){
            glm::mat4 rotate = glm::mat4(1.0f);
            rotate = glm::rotate(rotate, glm::radians(180.0f), glm::vec3(1.0f, 0.0f, 0.0f));
            Vertex_M point = {glm::vec3(rotate*glm::vec4(face[i].Position,1.0f)),glm::vec3(rotate*glm::vec4(face[i].Normal,1.0f)),face[i].TexCoords};
            cube.push_back(point);
        }

        for(int i = 0;i< 6;i++){
            glm::mat4 rotate = glm::mat4(1.0f);
            rotate = glm::rotate(rotate, glm::radians(270.0f), glm::vec3(1.0f, 0.0f, 0.0f));
            Vertex_M point = {glm::vec3(rotate*glm::vec4(face[i].Position,1.0f)),glm::vec3(rotate*glm::vec4(face[i].Normal,1.0f)),face[i].TexCoords};
            cube.push_back(point);
        }

        for(int i = 0;i< 6;i++){
            glm::mat4 rotate = glm::mat4(1.0f);
            rotate = glm::rotate(rotate, glm::radians(90.0f), glm::vec3(0.0f, 0.0f, 1.0f));
            Vertex_M point = {glm::vec3(rotate*glm::vec4(face[i].Position,1.0f)),glm::vec3(rotate*glm::vec4(face[i].Normal,1.0f)),face[i].TexCoords};
            cube.push_back(point);
        }

        for(int i = 0;i< 6;i++){
            glm::mat4 rotate = glm::mat4(1.0f);
            rotate = glm::rotate(rotate, glm::radians(270.0f), glm::vec3(0.0f, 0.0f, 1.0f));
            Vertex_M point = {glm::vec3(rotate*glm::vec4(face[i].Position,1.0f)),glm::vec3(rotate*glm::vec4(face[i].Normal,1.0f)),face[i].TexCoords};
            cube.push_back(point);
        }

        index.clear();

        for(int i = 0;i< 108;i++){
            index.push_back(i);
        }

        PushMesh(cube,index);
    }




};

#endif // CUBE_H
