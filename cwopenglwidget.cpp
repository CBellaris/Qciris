#include "cwopenglwidget.h"

CWOpenGLWidget::CWOpenGLWidget(QWidget *parent) : QOpenGLWidget(parent)
{
    setFocusPolicy(Qt::StrongFocus);
    connect(&timer,SIGNAL(timeout()),this,SLOT(on_timeout()));
    timer.start(1000/60);  //60fps
    setMouseTracking(true);
}

CWOpenGLWidget::~CWOpenGLWidget()
{
    delete scene;
}

void CWOpenGLWidget::on_timeout()
{
    update();
}

void CWOpenGLWidget::initializeGL()
{
    initializeOpenGLFunctions();

    glEnable(GL_DEPTH_TEST);
//    GLenum error = glGetError();
//    std::cout<<error;

    scene = new Scene;


}

void CWOpenGLWidget::resizeGL(int w, int h)
{
    scene->resize(w,h);
    lastX = w/2.0f;
    lastY = h/2.0f;
}

void CWOpenGLWidget::paintGL()
{
    glClearColor(0.2f,0.3f,0.3f,1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    scene->drawScene();
}

void CWOpenGLWidget::keyPressEvent(QKeyEvent *event)
{


    switch (event->key()) {
    case Qt::Key_Escape:
        close();
        break;
    case Qt::Key_Alt:
        Mousetrack = !Mousetrack;
        setMouseTracking(Mousetrack);
        break;
    case Qt::Key_W:
        scene->camera.MOVE_W = 1;
        break;
    case Qt::Key_A:
        scene->camera.MOVE_A = 1;
        break;
    case Qt::Key_S:
        scene->camera.MOVE_S = 1;
        break;
    case Qt::Key_D:
        scene->camera.MOVE_D = 1;
        break;
    };
}

void CWOpenGLWidget::keyReleaseEvent(QKeyEvent *event)
{
    switch (event->key()) {
    case Qt::Key_W:
        scene->camera.MOVE_W = 0;
        break;
    case Qt::Key_A:
        scene->camera.MOVE_A = 0;
        break;
    case Qt::Key_S:
        scene->camera.MOVE_S = 0;
        break;
    case Qt::Key_D:
        scene->camera.MOVE_D = 0;
        break;
    };
}

void CWOpenGLWidget::mouseMoveEvent(QMouseEvent *event)
{
        float xpos = event ->pos().x();
        float ypos = event ->pos().y();

        if (firstMouse)
        {
            lastX = xpos;
            lastY = ypos;
            firstMouse = false;
        }

        float xoffset = xpos - lastX;
        float yoffset = lastY - ypos; // reversed since y-coordinates go from bottom to top

        lastX = xpos;
        lastY = ypos;

        scene->camera.ProcessMouseMovement(xoffset, yoffset);
}

void CWOpenGLWidget::pushgeom(Scene::GEOM geo)
{
    makeCurrent();
    scene->PushGeom(geo);
    doneCurrent();
}




