import QtQuick 2.0

FocusScope{ //Se non mettessi FocusScope non riuscirei a spostarmi fra le AppLauncher con le keys

    property alias background: app.color
    property alias icon: app_icon.source
    property alias text: app_name.text
    property int __margin: parent.width*0.015

    implicitHeight: app.height
    implicitWidth: app.width

    //Every app is composed by a background, an icon and a text
    Rectangle {
        id: app
        radius:13
        width: app_icon.implicitWidth + __margin * 2
        height: app_icon.implicitHeight + __margin * 2
        focus: true
        border {
            color: activeFocus ? "#ffc20e" : color
            width: 5
        }

        Image {
            id: app_icon
            anchors.centerIn: parent
        }

        Text {
            id: app_name
            font.bold: true
            color: "white"
            anchors {
                top: parent.bottom
                topMargin: __margin / 2
                horizontalCenter: parent.horizontalCenter
            }
        }

    }

}
