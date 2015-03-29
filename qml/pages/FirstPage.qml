import QtQuick 2.1
import Sailfish.Silica 1.0
import org.nemomobile.time 1.0
import org.nemomobile.configuration 1.0

Page {
    id: page

    WallClock {
        id: wallClock
        updateFrequency: WallClock.Second
        enabled: true
    }

    ConfigurationValue {
        id: timeFormatConfig
        key: "/sailfish/i18n/lc_timeformat24h"
    }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        contentHeight: clockItem.height

        Item {
            id: clockItem
            width: Screen.height
            height: Screen.width

            Label {
                anchors.centerIn: parent
                property alias time: wallClock.time
                text: Qt.formatDateTime(wallClock.time, "hh:mm:ss")
            }

            MouseArea {
                anchors.fill: parent
                onClicked: popup.notify("hello world!")
            }
        }
    }
}


