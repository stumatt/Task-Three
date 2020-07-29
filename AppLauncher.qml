import QtQuick 2.0

Item {

    property alias background: app.color
    property alias icon: app_icon.source
    property alias text: app_name.text
    property int __margin: parent.width*0.015

    implicitHeight: app.height
    implicitWidth: app.width

    Rectangle {
        id: app
        radius:13
        width: app_icon.implicitWidth + __margin * 2
        height: app_icon.implicitHeight + __margin * 2

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