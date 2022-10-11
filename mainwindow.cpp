#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDir>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    setCentralWidget(ui->openGLWidget);

    QDir::setCurrent ( "C:/dev/QT/Qciris" );
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_actioncube_triggered()
{
    ui->openGLWidget->pushgeom(Scene::CUBE);
}
