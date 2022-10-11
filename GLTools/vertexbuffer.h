#ifndef VERTEXBUFFER_H
#define VERTEXBUFFER_H

#include "GLTools/renderer.h"


class VertexBuffer : public QOpenGLExtraFunctions
{
private:
    unsigned int m_RendererID;

public:
    VertexBuffer(const void* data, unsigned int size);
    ~VertexBuffer();

    void Bind() ;
    void Unbind() ;


};

#endif // VERTEXBUFFER_H
