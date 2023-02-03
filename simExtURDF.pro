include(config.pri)

QT -= core
QT -= gui

TARGET = simExtURDF
TEMPLATE = lib

DEFINES -= UNICODE
DEFINES += SIM_MATH_DOUBLE
CONFIG += shared plugin
INCLUDEPATH += "../include"
greaterThan(QT_MAJOR_VERSION,4): QT += widgets

*-msvc* {
    QMAKE_CXXFLAGS += -O2
    QMAKE_CXXFLAGS += -W3
}
*-g++* {
    QMAKE_CXXFLAGS += -O3
    QMAKE_CXXFLAGS += -Wall
    QMAKE_CXXFLAGS += -Wno-unused-parameter
    QMAKE_CXXFLAGS += -Wno-strict-aliasing
    QMAKE_CXXFLAGS += -Wno-empty-body
    QMAKE_CXXFLAGS += -Wno-write-strings

    QMAKE_CXXFLAGS += -Wno-unused-but-set-variable
    QMAKE_CXXFLAGS += -Wno-unused-local-typedefs
    QMAKE_CXXFLAGS += -Wno-narrowing

    QMAKE_CFLAGS += -O3
    QMAKE_CFLAGS += -Wall
    QMAKE_CFLAGS += -Wno-strict-aliasing
    QMAKE_CFLAGS += -Wno-unused-parameter
    QMAKE_CFLAGS += -Wno-unused-but-set-variable
    QMAKE_CFLAGS += -Wno-unused-local-typedefs
}

INCLUDEPATH += $$BOOST_INCLUDEPATH

win32 {
    DEFINES += WIN_SIM
}

macx {
    DEFINES += MAC_SIM
}

unix:!macx {
    DEFINES += LIN_SIM
}

SOURCES += \
    simExtURDF.cpp \
    tinyxml2/tinyxml2.cpp \
    robot.cpp \
    link.cpp \
    joint.cpp \
    sensor.cpp \
    commonFunctions.cpp \
    ../include/simMath/3Vector.cpp \
    ../include/simMath/3X3Matrix.cpp \
    ../include/simMath/4Vector.cpp \
    ../include/simMath/4X4Matrix.cpp \
    ../include/simMath/MMatrix.cpp \
    ../include/simMath/7Vector.cpp \
    ../include/simMath/MyMath.cpp \
    ../include/simLib.cpp \
    ../include/scriptFunctionData.cpp \
    ../include/scriptFunctionDataItem.cpp \
    rospackagehelper.cpp

HEADERS +=\
    simExtURDF.h \
    tinyxml2/tinyxml2.h \
    robot.h \
    link.h \
    joint.h \
    sensor.h \
    commonFunctions.h \
    ../include/simMath/3Vector.h \
    ../include/simMath/3X3Matrix.h \
    ../include/simMath/4Vector.h \
    ../include/simMath/4X4Matrix.h \
    ../include/simMath/MMatrix.h \
    ../include/simMath/7Vector.h \
    ../include/simMath/MyMath.h \
    ../include/simLib.h \
    ../include/scriptFunctionData.h \
    ../include/scriptFunctionDataItem.h \
    rospackagehelper.h

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}
