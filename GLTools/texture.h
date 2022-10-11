#ifndef TEXTURE_H
#define TEXTURE_H

#include "GLTools/renderer.h"


enum Tex_type {
    TEX_2D,TEX_HDR
};

class Texture : QOpenGLExtraFunctions
{
private:
    unsigned int ID;
    unsigned int HDR;
    std::string FilePath;
    Tex_type Type;

public:
    Texture(const std::string& FilePath,Tex_type tex = TEX_2D);
    ~Texture();

    void Bind(unsigned int slot = 0) ;
    void Unbind() ;

};

#endif // TEXTURE_H
