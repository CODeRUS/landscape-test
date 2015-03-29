import QtQuick 2.1
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        contentHeight: content.height

        Column {
            id: content
            width: parent.width

            ComboBox {
                width: parent.width
                label: "Test combobox"

                menu: ContextMenu {
                    MenuItem { text: "1" }
                    MenuItem { text: "2" }
                    MenuItem { text: "3" }
                    MenuItem { text: "4" }
                    MenuItem { text: "5" }
                    MenuItem { text: "6" }
                    MenuItem { text: "7" }
                    MenuItem { text: "8" }
                    MenuItem { text: "9" }
                }
            }
        }
    }
}





