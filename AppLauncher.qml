import QtQuick 2.0

FocusScope{ //Se non mettessi FocusScope non riuscirei a spostarmi fra le AppLauncher con le keys

    property alias background: app.color
    property alias icon: app_icon.source
    property alias text: app_name.text
    property alias appHeight: app.height
    property alias appWidth: app.width
    property int margin: 0

    implicitHeight: app.height
    implicitWidth: app.width

    //Every app is composed by a background, an icon and a text
    Rectangle {
        id: app
        radius:13
        width:margin*10
        height:margin*10
        focus: true
        border {
            color: activeFocus ? "#ffc20e" : color
            width: 5
        }
        Image {
            id: app_icon
            anchors.centerIn: parent
        }

    }

    Text {
        id: app_name
        font.bold: true
        color: "white"
        anchors {
            top: app.bottom
            topMargin: margin / 2
            horizontalCenter: parent.horizontalCenter
        }
    }

}
