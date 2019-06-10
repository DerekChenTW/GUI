import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Particles 2.0
import DataVisualization.Backend 1.0
import QtDataVisualization 1.0

Window {
    id: window
    width: 1080
    height: 560
    color: "#0f100f"
    visible: true
    title: qsTr("Qt Quick Controls 2 - Imagine Style")

    readonly property color colorGlow: "#1d6d64"
    readonly property color colorWarning: "#d5232f"
    readonly property color colorMain: "#6affcd"
    readonly property color colorBright: "#ffffff"
    readonly property color colorLightGrey: "#888"
    readonly property color colorDarkGrey: "#333"

    property double ratio: 1.0
    property int sliderMin: 0
    property int sliderMax: canvas.height
    property int bias: 12

    property real sliderVal

    property int x_position: slider2.value/2 + slider3.value/10
    property int y_position: slider1.value/2 + slider4.value/10
    property int columnFactor: 1.0

    Backend {
        id:backend
    }

    Rectangle {
        x: 907
        y: 30
        height: 500
        width: 2
        color: colorGlow
        implicitWidth: 1
        Layout.fillHeight: true
    }

    Rectangle {
        x: 122
        y: 30
        height: 500
        width: 2
        color: colorGlow
        implicitWidth: 1
        Layout.fillHeight: true
    }

    Canvas {
        id: canvas
        anchors {
            left: moving_circle.left
            right: sliderLayout.right
            top: sliderLayout.top
            bottom: sliderLayout.bottom
            margins: 8
        }
        property real lastX
        property real lastY
        property color color: colorTools.paintColor
        height: 464
        anchors.bottomMargin: 7

        onPaint: {
            var ctx = getContext('2d')
            ctx.lineWidth = 1.5
            ctx.strokeStyle = colorMain
            ctx.beginPath()
            ctx.moveTo(x_position,y_position)
            ctx.lineTo(815,sliderLayout.height-slider1.value - bias)
            ctx.lineTo(839,sliderLayout.height-slider2.value - bias)
            ctx.lineTo(861,sliderLayout.height-slider3.value - bias)
            ctx.lineTo(891,sliderLayout.height-slider4.value - bias)
            ctx.lineTo(915,sliderLayout.height-slider5.value - bias)
            ctx.stroke()
        }
        function clear_canvas() {
            var ctx = getContext("2d");
            ctx.reset();
            canvas.requestPaint();
        }
    }


    Image {
        id:dataVisualization
        width: 744
        height: 466
        anchors.leftMargin: 145
        anchors.topMargin: 60
        fillMode: Image.PreserveAspectCrop
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        //anchors.fill: parent
        source: "resources/testdata-diagram_01.png"
    }

    ColumnLayout {
        id: leftTabBar
        x: 32
        y: 93


        Layout.fillWidth: false
        Layout.fillHeight: true

        Button {
            style: buttonStyle
            checkable: true
            checked: true
            Layout.fillHeight: true

            Text {
                text: qsTr("Data")
                font.pointSize: 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                transformOrigin: Item.Center
                color: colorGlow
            }
        }

        Button {
            style: buttonStyle
            checkable: true
            checked: true
            Layout.fillHeight: true

            Text {
                text: qsTr("Model")
                font.pointSize: 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                transformOrigin: Item.Center
                color: colorGlow
            }
        }

        Button {
            style: buttonStyle
            checkable: true
            checked: true
            Layout.fillHeight: true

            Text {
                text: qsTr("Command")
                font.pointSize: 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                transformOrigin: Item.Center
                color: colorGlow
            }
        }

        Button {
            style: buttonStyle
            checkable: true
            Layout.fillHeight: true

            Text {
                text: qsTr("Settings")
                font.pointSize: 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                transformOrigin: Item.Center
                color: colorGlow
            }
        }
    }

    Text {
        anchors.bottom: dataVisualization.bottom
        x: 469
        y: 511
        width: 142
        height: 27
        wrapMode: Text.WordWrap
        color: "white"
        text: "Beam radius(μm)"
        anchors.bottomMargin: -12
        font.pointSize: 15
    }
    Text {
        x : 75
        y : 277
        width: 160
        wrapMode: Text.WordWrap
        color: "white"
        text: "Drilling velocity(m/s)"
        font.pointSize: 15
        rotation: 270
    }




    Canvas {
        id:moving_circle
        width: 760
        height: 523
        anchors.topMargin: 68
        anchors.leftMargin: 122
        anchors.bottomMargin: 62
        anchors.rightMargin: 172
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = "lightslategray"
            ctx.beginPath();
            ctx.ellipse(x_position, y_position, 30, 30);
            ctx.fill();
        }
        function clear_canvas() {
            var ctx = getContext("2d");
            ctx.reset();
            moving_circle.requestPaint();
        }
    }

    RowLayout {
        id: sliderLayout
        x: 938
        y: 70
        width: 115
        height: 440
        anchors.topMargin: 60
        spacing: 10
        anchors.right: right
        anchors.top: parent.top
        anchors.margins: 30

        Slider {
            id: slider1
            y: 0
            height: 435
            orientation: Qt.Vertical
            value: 50
            maximumValue: sliderMax
            minimumValue: sliderMin
            implicitHeight: 435
            style: sliderStyle


            onValueChanged: function(){
                canvas.clear_canvas()
                canvas.requestPaint()
                moving_circle.x = x_position
                moving_circle.y = y_position
                moving_circle.clear_canvas()
            }
            Text{
                y: 445
                color: "white"
                text: Math.floor(slider1.value)
                styleColor: "#372828"
                font.pointSize: 9
            }
        }

        Slider {
            id: slider2
            y: 0
            height: 435
            orientation: Qt.Vertical
            value: 50
            maximumValue: sliderMax
            minimumValue: sliderMin
            implicitHeight: 435
            style: sliderStyle
            onValueChanged: function(){
                canvas.clear_canvas()
                canvas.requestPaint()
                moving_circle.x = x_position
                moving_circle.y = y_position
                moving_circle.clear_canvas()
            }
            Text{
                y: 445
                color: "white"
                text: Math.floor(slider2.value)
                styleColor: "#282020"
                font.pointSize: 9
            }
        }
        Slider {
            id: slider3
            y: 0
            height: 435
            orientation: Qt.Vertical
            value: 50
            maximumValue: sliderMax
            minimumValue: sliderMin
            implicitHeight: 435
            style: sliderStyle
            onValueChanged: function(){
                canvas.clear_canvas()
                canvas.requestPaint()
                moving_circle.x = x_position
                moving_circle.y = y_position
                moving_circle.clear_canvas()
            }
            Text{
                y: 445
                color: "#f9f9f9"
                text: Math.floor(slider3.value)
                styleColor: "#1c1a1a"
                font.pointSize: 9
            }
        }
        Slider {
            id: slider4
            y: 0
            height: 435
            clip: false
            orientation: Qt.Vertical
            value: 50
            maximumValue: sliderMax
            minimumValue: sliderMin
            implicitHeight: 435
            style: sliderStyle
            onValueChanged: function(){
                canvas.clear_canvas()
                canvas.requestPaint()
                moving_circle.x = x_position
                moving_circle.y = y_position
                moving_circle.clear_canvas()
            }
            Text{
                y: 445
                color: "white"
                text: Math.floor(slider4.value)
                styleColor: "#2c2525"
                font.pointSize: 9
            }
        }
        Slider {
            id: slider5
            y: 0
            height: 435
            orientation: Qt.Vertical
            value: 50
            maximumValue: sliderMax
            minimumValue: sliderMin
            implicitHeight: 435
            style: sliderStyle
            onValueChanged: function(){
                canvas.clear_canvas()
                canvas.requestPaint()
                moving_circle.x = x_position
                moving_circle.y = y_position
                moving_circle.clear_canvas()
            }
            Text{
                y: 445
                color: "white"
                text: Math.floor(slider5.value)
                styleColor: "#443c3c"
                font.pointSize: 9
            }
        }


    }

    // Style delegates:

    Component {
        id: buttonStyle

        ButtonStyle {
            background: Rectangle {
                color: control.pressed ? colorGlow : "transparent"
                antialiasing: true
                border.color: colorGlow
                implicitWidth: 60
                implicitHeight: 90
            }
        }
    }

    Component {
        id: sliderStyle
        SliderStyle {
            handle: Rectangle {
                width: 15
                height: 15
                color: control.pressed ? "darkgray" : "lightGray"
                border.color: "black"
                antialiasing: true
                radius: height/2
                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 1
                    color: "transparent"
                    antialiasing: true
                    border.color: "#eee"
                    radius: height/2
                }
            }

            groove: Rectangle {
                height: 8
                implicitWidth: window.width / columnFactor
                implicitHeight: 22

                antialiasing: true
                color: "#ccc"
                border.color: "#777"
                radius: height/2
                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 1
                    color: "transparent"
                    antialiasing: true
                    border.color: "#66ffffff"
                    radius: height/2
                }
            }
        }
    }


}
