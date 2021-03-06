import QtQuick 2.0
import Sailfish.Silica 1.0

MouseArea {
    id: popup
    parent: pageStack.currentPage ? pageStack.currentPage : appWindow
    anchors.top: parent.top
    width: parent.width
    height: Math.max(Theme.itemSizeLarge, message.paintedHeight + (Theme.paddingLarge * 2))
    property alias title: message.text
    property alias timeout: hideTimer.interval
    property alias background: bg.color
    visible: opacity > 0
    opacity: 0.0

    Behavior on opacity {
        FadeAnimation {}
    }

    Rectangle {
        id: bg
        anchors.fill: parent
    }

    Timer {
        id: hideTimer
        triggeredOnStart: false
        repeat: false
        interval: 5000
        onTriggered: popup.hide()
    }

    function hide() {
        if (hideTimer.running)
            hideTimer.stop()
        popup.opacity = 0.0
    }

    function show() {
        popup.opacity = 1.0
        hideTimer.restart()
    }

    function notify(text, color, timeout) {
        popup.title = text
        if (color && (typeof(color) != "undefined"))
            bg.color = color
        else
            bg.color = Theme.rgba(Theme.highlightBackgroundColor, 0.9)
        if (timeout) {
            hideTimer.interval = timeout
        }
        else {
            hideTimer.interval = 5000
        }
        show()
    }

    Label {
        id: message
        anchors.verticalCenter: popup.verticalCenter
        font.pixelSize: 32
        anchors.left: parent.left
        anchors.leftMargin: Theme.paddingLarge
        anchors.right: parent.right
        anchors.rightMargin: Theme.paddingLarge
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
        wrapMode: Text.Wrap
    }

    onClicked: hide()
}
