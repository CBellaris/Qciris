#include "shader.h"

#include<iostream>
#include<fstream>
#include<sstream>

//用结构体返回多个值


Shader::Shader(const std::string& filepath):if_geometry(0)
{
    //m_FilePath = filepath;
    initializeOpenGLFunctions();
    ShaderProgramSource source = ParseShader(filepath);
    m_RendererID = CreateShader(source.VertexShader, source.FragmentShader,source.GeometryShader);
}

Shader::~Shader()
{
    glDeleteProgram(m_RendererID);
}


void Shader::Bind()
{
    glUseProgram(m_RendererID);
}

void Shader::Unbind()
{
    glUseProgram(0);

}

//将源代码分为vertex和fragment
ShaderProgramSource Shader::ParseShader(const std::string& filepath) {
    std::ifstream stream(filepath);

    std::string line;
    std::stringstream ss[3];
    enum class ShaderType {
        NONE = -1, VERTEX = 0, FRAGMENT = 1, GEOMETRY = 2
    };

    ShaderType type = ShaderType::NONE;

    while (getline(stream, line)) {
        if (line.find("#Shader") != std::string::npos) {
            if (line.find("vertex") != std::string::npos)
                type = ShaderType::VERTEX;
            else if (line.find("fragment") != std::string::npos)
                type = ShaderType::FRAGMENT;
            else if (line.find("geometry") != std::string::npos)
                {   type = ShaderType::GEOMETRY;
                    if_geometry = 1;
                }

        }
        else {
            ss[(int)type] << line << "\n";
        }

    }

    return { ss[0].str(),ss[1].str(),ss[2].str() };
}

//封装一些OpenGl编译shader的重复操作
unsigned int Shader::CompileShader(unsigned int type, const std::string& scource) {
    unsigned int id = glCreateShader(type);
    const char* scr = scource.c_str();
    glShaderSource(id, 1, &scr, nullptr);
    glCompileShader(id);

    int result;
    glGetShaderiv(id, GL_COMPILE_STATUS, &result);
    if (result == GL_FALSE) {
        int length;
        glGetShaderiv(id, GL_INFO_LOG_LENGTH, &length);
        char* message = (char*)alloca(length * sizeof(char));
        glGetShaderInfoLog(id, length, &length, message);
        std::cout << "Fail to compile\n" <<
            (type == GL_VERTEX_SHADER ? "vertex" : "fragment")
            << "shader" << std::endl;
        std::cout << message << std::endl;
        glDeleteShader(id);
        return 0;
    }

    return id;
}

unsigned int Shader::CreateShader(const std::string& vertexshader, const std::string& fragmentshader ,const std::string& geometryshader) {
    unsigned int program = glCreateProgram();
    unsigned int vs = CompileShader(GL_VERTEX_SHADER, vertexshader);
    unsigned int fs = CompileShader(GL_FRAGMENT_SHADER, fragmentshader);
    unsigned int gs = 0;
    if(if_geometry){
      gs = CompileShader(GL_GEOMETRY_SHADER, geometryshader);
      glAttachShader(program, gs);
    }

    glAttachShader(program, vs);
    glAttachShader(program, fs);

    glLinkProgram(program);
    glValidateProgram(program);

    glDeleteShader(vs);
    glDeleteShader(fs);
    if(if_geometry){
        glDeleteShader(gs);
    }

    return program;
}

void Shader::SetUniform1i(const std::string& name, int value)
{
    glUniform1i(GetUniformLocation(name), value);
}

void Shader::SetUniform1f(const std::string& name, float value)
{
    glUniform1f(GetUniformLocation(name), value);
}


void Shader::SetUniform4f(const std::string& name, float v0, float v1, float v2, float v3)
{
    glUniform4f(GetUniformLocation(name), v0, v1, v2, v3);
}

void Shader::SetUniform4fv(const std::string &name, glm::vec4 vector)
{
    glUniform4fv(GetUniformLocation(name),1, glm::value_ptr(vector));
}

void Shader::SetUniform3f(const std::string& name, float v0, float v1, float v2)
{
    glUniform3f(GetUniformLocation(name), v0, v1, v2);
}

void Shader::SetUniform3fv(const std::string& name, glm::vec3 vector)
{
    glUniform3fv(GetUniformLocation(name),1, glm::value_ptr(vector));
}

void Shader::SetUniformMatrix4f(const std::string& name, glm::mat4 matrix)
{
    glUniformMatrix4fv(GetUniformLocation(name), 1, GL_FALSE, glm::value_ptr(matrix));
}

int Shader::GetUniformLocation(const std::string& name)
{
    if (m_UniformLocationCache.find(name) != m_UniformLocationCache.end())
        return m_UniformLocationCache[name];

    int location = glGetUniformLocation(m_RendererID, name.c_str());
    if (location == -1)
        std::cout << "Warning: Uniform " << name << " does not exist" << std::endl;
    m_UniformLocationCache[name] = location;
    return location;
}
