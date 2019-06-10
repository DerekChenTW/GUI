###################
TEMPLATE = app
TARGET = UI-DataVisualization
QT  += qml quick

SOURCES += \
    backend.cpp \
    main.cpp
RESOURCES += \
    ui-datavisualization.qrc
OTHER_FILES += \
    main.qml

target.path = $$[QT_INSTALL_EXAMPLES]/quickcontrols/controls/styles
INSTALLS += target

###################

DISTFILES += \
    FeatureButton.qml \
    dataVisualization.py \
    images/bubble.png \
    images/button-pressed.png \
    images/button.png \
    images/progress-background.png \
    images/progress-fill.png \
    images/settings.png \
    images/slider-handle.png \
    images/statistics.png \
    images/tab.png \
    images/tab_selected.png \
    images/textfield.png \
    images/windows.png \
    resources/testdata-diagram_01.png \
    resources/testdata-pict.png

HEADERS += \ \
    backend.h
