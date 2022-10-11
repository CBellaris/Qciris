QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    GLTools/indexbuffer.cpp \
    GLTools/mesh.cpp \
    GLTools/mesh_tex.cpp \
    GLTools/renderer.cpp \
    GLTools/shader.cpp \
    GLTools/texture.cpp \
    GLTools/vertexarray.cpp \
    GLTools/vertexbuffer.cpp \
    Geom/model.cpp \
    cwopenglwidget.cpp \
    main.cpp \
    mainwindow.cpp \
    stb_image.cpp

HEADERS += \
    GLTools/Camera.h \
    GLTools/indexbuffer.h \
    GLTools/mesh.h \
    GLTools/mesh_tex.h \
    GLTools/renderer.h \
    GLTools/scene.h \
    GLTools/shader.h \
    GLTools/texture.h \
    GLTools/vertexarray.h \
    GLTools/vertexbuffer.h \
    GLTools/vertexbufferlayout.h \
    Geom/cube.h \
    Geom/model.h \
    Geom/plane.h \
    Items/Light.h \
    Material/Material.h \
    Material/Material_phong.h \
    Material/Material_phong_shadow.h \
    Material/Material_phong_tex.h \
    cwopenglwidget.h \
    mainwindow.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES +=

DISTFILES += \
    res/Shader/shader_default.shader \
    res/Shader/shader_phong.shader \
    res/Shader/shader_phong_shadow.shader \
    res/Shader/shader_phong_tex.shader \
    res/Shader/shader_shadowmapping.shader \
    res/nanosuit/LICENSE.txt \
    res/nanosuit/arm_dif.png \
    res/nanosuit/arm_showroom_ddn.png \
    res/nanosuit/arm_showroom_spec.png \
    res/nanosuit/body_dif.png \
    res/nanosuit/body_showroom_ddn.png \
    res/nanosuit/body_showroom_spec.png \
    res/nanosuit/glass_ddn.png \
    res/nanosuit/glass_dif.png \
    res/nanosuit/hand_dif.png \
    res/nanosuit/hand_showroom_ddn.png \
    res/nanosuit/hand_showroom_spec.png \
    res/nanosuit/helmet_diff.png \
    res/nanosuit/helmet_showroom_ddn.png \
    res/nanosuit/helmet_showroom_spec.png \
    res/nanosuit/leg_dif.png \
    res/nanosuit/leg_showroom_ddn.png \
    res/nanosuit/leg_showroom_spec.png \
    res/nanosuit/nanosuit.blend \
    res/nanosuit/nanosuit.mtl

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/Libs/ -lassimp-vc143-mt
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/Libs/ -lassimp-vc143-mtd

INCLUDEPATH += $$PWD/Include/assimp
DEPENDPATH += $$PWD/Include/assimp

INCLUDEPATH += Include
