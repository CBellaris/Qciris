#ifndef VERTEXARRAY_H
#define VERTEXARRAY_H

#include "vertexbuffer.h"
#include "vertexbufferlayout.h"
#include <QOpenGLExtraFunctions>


class VertexArray : public QOpenGLExtraFunctions
{
private:
    unsigned int m_RendererID;
public:
    VertexArray();
    ~VertexArray();


    void AddBuffer(VertexBuffer& vb, const VertexBufferLayout& layout);

    void Bind() ;
    void Unbind() ;

    inline unsigned int getRendererID() {
        return m_RendererID;
    }

};

#endif // VERTEXARRAY_H
