#include "texture.h"
#include "Include/stb_image.h"


Texture::Texture(const std::string& filepath,Tex_type tex)
    :FilePath(filepath),ID(0),Type(tex)
{
    initializeOpenGLFunctions();
    if (Type == TEX_2D)
       {
           glGenTextures(1, &ID);

           // 加载并生成纹理
           int width, height, nrChannels;
           stbi_set_flip_vertically_on_load(true);
           unsigned char* data = stbi_load(FilePath.c_str(), &width, &height, &nrChannels, 4); //最后一项0
           if (data)
           {

               GLenum format = GL_RGBA;
               if (nrChannels == 1)
                   format = GL_RGBA; //GL_RED
               else if (nrChannels == 3)
                   format = GL_RGBA;  //GL_RGB
               else if (nrChannels == 4)
                   format = GL_RGBA;

               glBindTexture(GL_TEXTURE_2D, ID);
               glTexImage2D(GL_TEXTURE_2D, 0, format, width, height, 0, format, GL_UNSIGNED_BYTE, data);
               glGenerateMipmap(GL_TEXTURE_2D);

               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, format == GL_RGBA ? GL_CLAMP_TO_EDGE : GL_REPEAT);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, format == GL_RGBA ? GL_CLAMP_TO_EDGE : GL_REPEAT);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

               stbi_image_free(data);
           }
           else
           {
               std::cout << "Failed to load texture" << std::endl;
           }


       }
       else
       {

           stbi_set_flip_vertically_on_load(true);
           int width, height, nrComponents;
           float* data = stbi_loadf(FilePath.c_str(), &width, &height, &nrComponents, 0);
           if (data)
           {
               glGenTextures(1, &ID);
               glBindTexture(GL_TEXTURE_2D, ID);
               glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB16F, width, height, 0, GL_RGB, GL_FLOAT, data);

               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

               stbi_image_free(data);
           }
           else
           {
               std::cout << "Failed to load texture" << std::endl;
           }


       }
}



Texture::~Texture()
{
    glDeleteTextures(1, &ID);
}

void Texture::Bind(unsigned int slot)
{
    glActiveTexture(GL_TEXTURE0 + slot);
    glBindTexture(GL_TEXTURE_2D, ID);

}

void Texture::Unbind()
{
    glBindTexture(GL_TEXTURE_2D, 0);

}
