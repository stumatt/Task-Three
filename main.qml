import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 700
    height: width/2
    title: qsTr("Task Three")

    Rectangle {
        id:root
        color:"#222"
        anchors.fill:parent

        //Blocco Media Player

        Rectangle {
            id:player

            anchors{
                top: root.top
                topMargin: 10
                left: root.left
                leftMargin: 10
                right: root.horizontalCenter
                bottom: root.verticalCenter
                bottomMargin: 0.03*root.height
            }

                        Image {
                            id: player_image
                            source: "images/taylor.jpg"
                            anchors.fill: parent
                        }

            Rectangle{
                id:playerbar
                width: player.width
                height: player.height*0.25
                color:"white"
                anchors.top: player.bottom


                Image {
                    id: thumbsup
                    source: "images/thumbs_up.png"
                    anchors {
                        verticalCenter: start.verticalCenter
                        left: playerbar.left
                        leftMargin: playerbar.width*0.05
                    }
                }

                Image {
                    id: previous
                    source: "images/previous.png"
                    anchors {
                        verticalCenter: start.verticalCenter
                        right: start.left
                        rightMargin: playerbar.width*0.15
                    }
                }
                Image {
                    id:start
                    source: "images/start.png"
                    anchors {
                        horizontalCenter: playerbar.horizontalCenter
                        verticalCenter: playerbar.verticalCenter
                    }
                }

                Image {
                    id: next
                    source: "images/next.png"
                    anchors {
                        verticalCenter: start.verticalCenter
                        left: start.right
                        leftMargin: playerbar.width*0.15
                    }
                }

                Image {
                    id: thumbsdown
                    source: "images/thumbs_down.png"
                    anchors {
                        verticalCenter: start.verticalCenter
                        right: playerbar.right
                        rightMargin: playerbar.width*0.05
                    }
                }
            }

        }

        //Blocco App

        AppLauncher {
            id:spotify
            icon: "images/spotify.png"
            background: "#0dd3ff"
            text: "Spotify"
            anchors {
                top: parent.top
                topMargin: __margin
                left: parent.horizontalCenter
                leftMargin: __margin * 4
            }
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
        }



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


        // Blocco app recenti

        AppLauncher {
            id:phone
            icon: "images/phone.png"
            background: "#72ef36"
            anchors {
                bottom: parent.bottom
                bottomMargin: __margin * 1.5
                left: parent.left
                leftMargin: __margin * 1.5
            }
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
        }


    }
}