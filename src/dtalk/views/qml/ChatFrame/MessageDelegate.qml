import QtQuick 2.1
import "../Widgets" as Widgets

Component {
	id: messageDelegate
	
    Item {
        id: wrapper
		width: wrapper.ListView.view.width
		height: messageBox.height + 20
        
        function adjustPosition() {
            wrapper.ListView.view.positionViewAtIndex(wrapper.ListView.view.count - 1, ListView.Contains)
        }
		
        Item {
	        id: messageBox
			x: instance.type_ == "received" ? 10 : parent.width - messageBox.messageWidth - 10
            /* instance: instance ? undefined : instance */
            width: parent.width
	        height: Math.max(messageBubble.height, personInfo.height)
            property real messageWidth: messageBubble.width + personInfo.width
	
	        Bubble {
		        id: messageBubble
		        message: instance.body
		        anchors.left: instance.type_ == "received" ? personInfo.right : messageBox.left
                maxWidth: parent.width * 0.66
		        y: 10
                type: instance.type_
	        }
		
	        Item {
		        id: personInfo
		        y: 10
		        width: 60; height: 50 + 15
		        anchors.left: instance.type_ == "received" ? messageBox.left : messageBubble.right
		        anchors.leftMargin: instance.type_ == "received" ? 0 : 10
		        Column {
                    spacing: 5
            
			        Widgets.RoundImageButton { 
				        source: instance.type_ == "received" ? messageModel.jidInfo.avatar : commonManager.ownerInfo.avatar;
                        smooth: true; 
				        anchors.horizontalCenter: parent.horizontalCenter
				        width: 50; height: 50
				    }
            
                    Widgets.GlowText {
                        text: instance.created
                        font.pixelSize: 10
				        anchors.horizontalCenter: parent.horizontalCenter
                
                    }
		        }
			
	        }
        }
            
        
		ListView.onAdd: SequentialAnimation {
            NumberAnimation { target: wrapper; properties: "scale"; from: 0.0; to: 1.0; easing.type: Easing.OutQuad }
            ScriptAction { script: adjustPosition() }            
        }
        
	}
}

