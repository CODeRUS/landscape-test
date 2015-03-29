import QtQuick 2.1
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow
{
    id: appWindow

    initialPage: Component { FirstPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")

    allowedOrientations: Orientation.Landscape
    _defaultPageOrientations: Orientation.Landscape

    Popup {
        id: popup
    }
}


