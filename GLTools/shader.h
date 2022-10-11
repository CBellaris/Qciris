#ifndef SHADER_H
#define SHADER_H

#include <string>
#include <unordered_map>
#include "glm/glm.hpp"
#include "glm/gtc/type_ptr.hpp"

#include <QOpenGLExtraFunctions>

struct ShaderProgramSource {
    std::string VertexShader;
    std::string FragmentShader;
    std::string GeometryShader;
};

class Shader : public QOpenGLExtraFunctions
{
private:
    std::string m_FilePath;
    unsigned int m_RendererID;
    std::unordered_map<std::string, int> m_UniformLocationCache;
    bool if_geometry;
public:
    Shader(const std::string& filepath);
    ~Shader();

    void Bind() ;
    void Unbind() ;

    void SetUniform1i(const std::string& name, int value);
    void SetUniform1f(const std::string& name, float value); 
    void SetUniform3f(const std::string& name, float v0, float v1, float v2);
    void SetUniform3fv(const std::string& name, glm::vec3 vector);
    void SetUniform4f(const std::string& name, float v0, float v1, float v2, float v3);
    void SetUniform4fv(const std::string& name,glm::vec4 vector);
    void SetUniformMatrix4f(const std::string& name, glm::mat4 matrix);

    inline unsigned int getID()
    {
        return m_RendererID;
    }

private:
    ShaderProgramSource ParseShader(const std::string& filepath);
    unsigned int CompileShader(unsigned int type, const std::string& scource);
    unsigned int CreateShader(const std::string& vertexshader, const std::string& fragmentshader ,const std::string& geometryshader);
    int GetUniformLocation(const std::string& name);
};

#endif // SHADER_H
