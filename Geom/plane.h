#ifndef PLANE_H
#define PLANE_H

#include "GLTools/mesh.h"
#include "QOpenGLExtraFunctions"

class Plane :public Mesh{
public:
    Plane(): lenght(2.0f),width(2.0f)
    {
        genMesh();
    }

    void reset(float lenght)
    {
        this->lenght = lenght;
        this->width = lenght;
        genMesh();
    }



private:
    float lenght;
    float width;

    void genMesh(){
        Vertex_M point1 = {glm::vec3( lenght/2, 0.0f, -width/2), glm::vec3(0.0f,1.0f,0.0f),glm::vec2(1.0f,0.0f)};
        Vertex_M point2 = {glm::vec3( lenght/2, 0.0f, width/2),  glm::vec3(0.0f,1.0f,0.0f),glm::vec2(1.0f,1.0f)};
        Vertex_M point3 = {glm::vec3(-lenght/2, 0.0f, width/2),  glm::vec3(0.0f,1.0f,0.0f),glm::vec2(0.0f,1.0f)};
        Vertex_M point4 = {glm::vec3(-lenght/2, 0.0f, -width/2), glm::vec3(0.0f,1.0f,0.0f),glm::vec2(0.0f,0.0f)};

        vector<Vertex_M> plane;
        plane.push_back(point1);
        plane.push_back(point2);
        plane.push_back(point3);
        plane.push_back(point1);
        plane.push_back(point3);
        plane.push_back(point4);

        vector<unsigned int> index;

        for(unsigned int i = 0;i< 6;i++)
            index.push_back(i);

        PushMesh(plane,index);

    }
};

#endif // PLANE_H
