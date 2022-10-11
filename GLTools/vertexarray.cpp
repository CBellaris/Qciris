#include "vertexarray.h"


VertexArray::VertexArray()
{
    initializeOpenGLFunctions();
    glGenVertexArrays(1, &m_RendererID);
}

VertexArray::~VertexArray()
{

}

void VertexArray::AddBuffer(VertexBuffer& vb, const VertexBufferLayout& layout)
{
    Bind();
    vb.Bind();
    const auto& elements = layout.GetElements();
    unsigned int offset = 0;
    for (unsigned int i = 0;i<elements.size();i++)
    {
        const auto& element = elements[i];
        glEnableVertexAttribArray(i);
        glVertexAttribPointer(i, element.Count, element.type, element.normalized,
            layout.GetStride(), (const void*)offset);  //指定缓冲区的数据形式
        offset += element.Count * VertexBufferElement::GetSizeOfType(element.type);
    }

}


void VertexArray::Bind()
{
    glBindVertexArray(m_RendererID);
}

void VertexArray::Unbind()
{
    glBindVertexArray(0);
}
