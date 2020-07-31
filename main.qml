import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 700
    height: width/2
    title: qsTr("Task Three")

    //Root
    Rectangle {
        id:root
        color:"#222"
        anchors.fill:parent

        Loader {
            id:loader
            sourceComponent: media_player
            focus: true
            anchors{
                top: root.top
                topMargin: 10
                left: root.left
                leftMargin: 10
                right: root.horizontalCenter
                bottom: root.verticalCenter
                bottomMargin: 0.03*root.height
            }
        }

        //Media Player
        Component {
            id: media_player

            Rectangle {
                id:player
                width: loader.width
                height: loader.height
                //activeFocusOnTab: true
                //focus: true
                Image {
                    id: player_image
                    source: "images/taylor.jpg"
                    anchors.fill: parent
                    //focus: true
                }

                //PlayerBar
                Rectangle{
                    id:playerbar
                    width: player.width
                    height: player.height*0.25
                    color:"white"
                    anchors.top: player.bottom
                    //activeFocusOnTab: true

                    //Player Buttons
                    BorderImage {
                        id: thumbsup
                        source: "images/thumbs_up.png"
                        //focus: true
                        anchors {
                            verticalCenter: start.verticalCenter
                            left: playerbar.left
                            leftMargin: playerbar.width*0.05
                        }
                        Keys.onRightPressed: previous.focus = true
                        Keys.onLeftPressed: thumbsdown.focus = true
                        Keys.onBacktabPressed: phone.focus = true
                        Keys.onTabPressed: spotify.focus = true

                        Rectangle {
                            anchors.fill: parent
                            anchors.margins: -border.width
                            z: -1
                            border.width: 3
                            border.color: "#ffc20e"
                            color: 'transparent'
                            visible: parent.activeFocus ? true:false
                        }
                    }


                    BorderImage {
                        id: previous
                        source: "images/previous.png"
                        //focus: true
                        anchors {
                            verticalCenter: start.verticalCenter
                            right: start.left
                            rightMargin: playerbar.width*0.15
                        }
                        Keys.onLeftPressed: thumbsup.focus = true
                        Keys.onRightPressed: start.focus = true
                        Keys.onBacktabPressed: phone.focus = true
                        Keys.onTabPressed: spotify.focus = true

                        Rectangle {
                            anchors.fill: parent
                            anchors.margins: -border.width
                            z: -1
                            border.width: 3
                            border.color: "#ffc20e"
                            color: 'transparent'
                            visible: parent.activeFocus ? true:false
                        }
                    }

                    BorderImage {
                        id:start
                        source: "images/start.png"
//                        activeFocusOnTab: true
                        focus: true
                        anchors {
                            horizontalCenter: playerbar.horizontalCenter
                            verticalCenter: playerbar.verticalCenter
                        }
                        Keys.onLeftPressed: previous.focus = true
                        Keys.onRightPressed: next.focus = true
                        Keys.onBacktabPressed: phone.focus = true
                        Keys.onTabPressed: spotify.focus = true

                        Rectangle {
                            anchors.fill: parent
                            anchors.margins: -border.width
                            z: -1
                            border.width: 3
                            border.color: "#ffc20e"
                            color: 'transparent'
                            visible: parent.activeFocus ? true:false
                        }
                    }

                    BorderImage {
                        id: next
                        source: "images/next.png"
                        //focus: true
                        anchors {
                            verticalCenter: start.verticalCenter
                            left: start.right
                            leftMargin: playerbar.width*0.15
                        }
                        Keys.onLeftPressed: start.focus = true
                        Keys.onRightPressed: thumbsdown.focus = true
                        Keys.onBacktabPressed: phone.focus = true
                        Keys.onTabPressed: spotify.focus = true

                        Rectangle {
                            anchors.fill: parent
                            anchors.margins: -border.width
                            z: -1
                            border.width: 3
                            border.color: "#ffc20e"
                            color: 'transparent'
                            visible: parent.activeFocus ? true:false
                        }

                    }

                    BorderImage {
                        id: thumbsdown
                        source: "images/thumbs_down.png"
                        //focus: true
                        anchors {
                            verticalCenter: start.verticalCenter
                            right: playerbar.right
                            rightMargin: playerbar.width*0.05
                        }
                        Keys.onLeftPressed: next.focus = true
                        Keys.onRightPressed: thumbsup.focus = true
                        Keys.onBacktabPressed: phone.focus = true
                        Keys.onTabPressed: spotify.focus = true

                        Rectangle {
                            anchors.fill: parent
                            anchors.margins: -border.width
                            z: -1
                            border.width: 3
                            border.color: "#ffc20e"
                            color: 'transparent'
                            visible: parent.activeFocus ? true:false
                        }
                    }
                }

            }


        }

        //Other Apps
        AppLauncher {
            id:spotify
            icon: "images/spotify.png"
            background: "#0dd3ff"
            text: "Spotify"
            focus:true            
            anchors {
                top: parent.top
                topMargin: __margin
                left: parent.horizontalCenter
                leftMargin: __margin * 4
            }
            KeyNavigation.left: youtube
            KeyNavigation.right: playstore
            KeyNavigation.up: pandora
            KeyNavigation.down: pandora
            KeyNavigation.backtab: loader
            KeyNavigation.tab: phone
        }



        AppLauncher {
            id:playstore
            icon: "images/playstore.png"
            background: "#a51890"
            text: "Play Store"
            anchors {
                top: parent.top
                topMargin: __margin
                left: spotify.right
                leftMargin: __margin * 4
            }
            KeyNavigation.left: spotify
            KeyNavigation.right: youtube
            KeyNavigation.up: playmusic
            KeyNavigation.down: playmusic
            KeyNavigation.backtab: loader
            KeyNavigation.tab: phone
        }

        AppLauncher {
            id:youtube
            icon: "images/youtube.png"
            background: "#fe5000"
            text: "Youtube"
            anchors {
                top: parent.top
                topMargin: __margin
                left: playstore.right
                leftMargin: __margin * 4
            }
            KeyNavigation.left: playstore
            KeyNavigation.right: spotify
            KeyNavigation.up: downloads
            KeyNavigation.down: downloads
            KeyNavigation.backtab: loader
            KeyNavigation.tab: phone
        }

        AppLauncher {
            id: pandora
            icon: "images/pandora.png"
            background: "#fff"
            text: "Pandora"
            anchors {
                top: spotify.bottom
                topMargin: __margin * 3
                left: parent.horizontalCenter
                leftMargin: __margin * 4
            }
            KeyNavigation.left: downloads
            KeyNavigation.right: playmusic
            KeyNavigation.up: spotify
            KeyNavigation.down: spotify
            KeyNavigation.backtab: loader
            KeyNavigation.tab: phone
        }

        AppLauncher {
            id: playmusic
            icon: "images/playmusic.png"
            background: "yellow"
            text: "Play Music"
            anchors {
                top: playstore.bottom
                topMargin: __margin * 3
                left: pandora.right
                leftMargin: __margin * 4
            }
            KeyNavigation.left: pandora
            KeyNavigation.right: downloads
            KeyNavigation.up: playstore
            KeyNavigation.down: playstore
            KeyNavigation.backtab: loader
            KeyNavigation.tab: phone
        }

        AppLauncher {
            id: downloads
            icon: "images/downloads.png"
            background: "#72ef36"
            text: "Downloads"
            anchors {
                top: youtube.bottom
                topMargin: __margin * 3
                left: playmusic.right
                leftMargin: __margin * 4
            }
            KeyNavigation.left: playmusic
            KeyNavigation.right: pandora
            KeyNavigation.up: youtube
            KeyNavigation.down: youtube
            KeyNavigation.backtab: loader
            KeyNavigation.tab: phone
        }


        // Three lines in the middle
        Rectangle {
            id:left
            color:"#d7d7d8"
            width: root.width*0.03
            height: root.height*0.01
            anchors
            {
                bottom: menu.top
                bottomMargin: 25
                right: center.left
                rightMargin: 10
            }
        }

        Rectangle {
            id:center
            color:"white"
            width: root.width*0.03
            height: root.height*0.01
            anchors
            {
                bottom: menu.top
                bottomMargin: 25
                horizontalCenter: root.horizontalCenter
            }
        }

        Rectangle {
            id:right
            color:"#d7d7d8"
            width: root.width*0.03
            height: root.height*0.01
            anchors
            {
                bottom: menu.top
                bottomMargin: 25
                left: center.right
                leftMargin: 10
            }
        }


        //Recent Apps
        AppLauncher {
            id:phone
            icon: "images/phone.png"
            background: "#72ef36"
            //focus:true
            anchors {
                bottom: parent.bottom
                bottomMargin: __margin * 1.5
                left: parent.left
                leftMargin: __margin * 1.5
            }
            KeyNavigation.left: settings
            KeyNavigation.right: podcast
            KeyNavigation.backtab: loader
            KeyNavigation.tab: spotify
        }

        AppLauncher {
            id:podcast
            icon: "images/podcast.png"
            background: "#a51890"
            anchors {
                bottom: parent.bottom
                bottomMargin: __margin * 1.5
                left: phone.right
                leftMargin: __margin * 2.4
            }
            KeyNavigation.left: phone
            KeyNavigation.right: play
            KeyNavigation.backtab: loader
            KeyNavigation.tab: spotify
        }

        AppLauncher {
            id:play
            icon: "images/play.png"
            background: "#0dd3ff"
            anchors {
                bottom: parent.bottom
                bottomMargin: __margin * 1.5
                left: podcast.right
                leftMargin: __margin * 2.4
            }
            KeyNavigation.left: podcast
            KeyNavigation.right: menu
            KeyNavigation.backtab: loader
            KeyNavigation.tab: spotify
        }

        AppLauncher {
            id:menu
            icon: "images/menu.png"
            background: "#fff"
            anchors {
                bottom: parent.bottom
                bottomMargin: __margin * 1.5
                left: play.right
                leftMargin: __margin * 2.4
            }
            KeyNavigation.left: play
            KeyNavigation.right: maps
            KeyNavigation.backtab: loader
            KeyNavigation.tab: spotify
        }

        AppLauncher {
            id:maps
            icon: "images/maps.png"
            background: "white"
            anchors {
                bottom: parent.bottom
                bottomMargin: __margin * 1.5
                left: menu.right
                leftMargin: __margin * 2.4
            }
            KeyNavigation.left: menu
            KeyNavigation.right: music
            KeyNavigation.backtab: loader
            KeyNavigation.tab: spotify
        }

        AppLauncher {
            id:music
            icon: "images/music.png"
            background: "purple"
            anchors {
                bottom: parent.bottom
                bottomMargin: __margin * 1.5
                left: maps.right
                leftMargin: __margin * 2.4
            }
            KeyNavigation.left: maps
            KeyNavigation.right: settings
            KeyNavigation.backtab: loader
            KeyNavigation.tab: spotify
        }

        AppLauncher {
            id:settings
            icon: "images/settings.png"
            background: "#caccd1"
            anchors {
                bottom: parent.bottom
                bottomMargin: __margin * 1.5
                right: root.right
                rightMargin: __margin * 1.5
            }
            KeyNavigation.left: music
            KeyNavigation.right: phone
            KeyNavigation.backtab: loader
            KeyNavigation.tab: spotify
        }


    }
}
