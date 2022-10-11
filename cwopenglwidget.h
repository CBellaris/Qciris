#ifndef CWOPENGLWIDGET_H
#define CWOPENGLWIDGET_H

#include <QOpenGLWidget>
#include <QOpenGLExtraFunctions>
#include <QOpenGLShaderProgram>
#include <QKeyEvent>
#include <QMouseEvent>
#include <QTime>
#include <QTimer>

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include "GLTools/scene.h"



class CWOpenGLWidget : public QOpenGLWidget,QOpenGLExtraFunctions
{
    Q_OBJECT

public: 
    explicit CWOpenGLWidget(QWidget *parent = nullptr);
    ~CWOpenGLWidget();

public slots:
    void on_timeout();

protected:
    virtual void initializeGL();
    virtual void resizeGL(int w, int h);
    virtual void paintGL();

    void keyPressEvent(QKeyEvent *event);
    void keyReleaseEvent(QKeyEvent *event);
    void mouseMoveEvent(QMouseEvent * event);



private:
    Scene *scene;


    bool firstMouse = true;
    bool Mousetrack = true;
    float lastX;
    float lastY;

    QTimer timer;
public:
    void pushgeom(Scene::GEOM geo);

};

#endif // CWOPENGLWIDGET_H
