import QtQuick 2.1
import "../Widgets"
import QtQuick.Window 2.1

Window {
    id: win
    width: container.width; height: container.height
    x: trayIcon.getPos().x - width / 2
    y: trayIcon.getPos().y - height
    visible: (trayIcon.hovered || mouseArea.containsMouse) && notifyView.model.count > 0
    flags: Qt.FramelessWindowHint | Qt.Popup
	color: "transparent"
    
    DRectangle {
        id: container
        width: 230 + container.blurWidth * 2
        borderMargin: 12
        rectRadius: 3
        height: Math.min(notifyView.model.count * notifyView.itemHeight + container.blurWidth * 2 + title.height + borderMargin*2, 240)
        
        Item {
            id: title
            width: parent.width
            height: 18
            
            Row {
                anchors.fill: parent
                spacing: 6
                
                Text {
                    text: "消息"
                    font.pixelSize: 12
                    color: "#ffffff"
                }
                
                Text {
                    text: "(" + notifyView.model.count + ")"
                    font.pixelSize: 12
                    color: Qt.rgba(1, 1, 1, 0.4)
                }
            }            
        }
        
        ScrollWidget {
            anchors.top: title.bottom
            anchors.bottom: parent.bottom
            width: parent.width
            ListView {
                id: notifyView
                property int itemHeight: 30
                anchors.fill: parent
                clip: true
                delegate: NotifyDelegate {}
                model: controlManager.getNotifyModel()
                focus: true
            }
        }
    }
    
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true

        onClicked: {
            mouse.accepted = false
        }
    }
}