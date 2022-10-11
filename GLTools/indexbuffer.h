#ifndef INDEXBUFFER_H
#define INDEXBUFFER_H
#include "renderer.h"

class IndexBuffer : QOpenGLExtraFunctions
{
private:
    unsigned int m_RendererID;
    unsigned int m_Count;
public:
    IndexBuffer(const unsigned int* data, unsigned int count);
    ~IndexBuffer();

    void Bind() ;
    void Unbind() ;
    unsigned int Getcount() const;


};

#endif // INDEXBUFFER_H
