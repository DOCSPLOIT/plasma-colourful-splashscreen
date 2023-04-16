// /*
//     SPDX-FileCopyrightText: 2014 Marco Martin <mart@kde.org>
//
//     SPDX-License-Identifier: GPL-2.0-or-later
// */
//
import QtQuick 2.5
import QtQuick.Window 2.2
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kcm 1.6 as KCM


Rectangle {
    id: root
    color: "#222527"
    property int stage

    onStageChanged: {
        if (stage == 2) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.target = busyIndicator;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
        }
    }
    Item{
        id:content;
        height:PlasmaCore.Units.gridUnit * 12
        width:PlasmaCore.Units.gridUnit * 12
        // height:64
        // width:64
        anchors.centerIn:parent
        Rectangle{
            anchors.fill:parent
            color:"transparent"
            Rectangle{
            id:layer
            color:"transparent"
            anchors.fill:parent
            anchors.leftMargin:parent.height*.094
            anchors.topMargin:parent.height*.0781
            anchors.bottomMargin:parent.height*.094
            anchors.rightMargin:parent.height*.094

            Image {
           id:peace
          source:"images/peace.svg";
          anchors.right:parent.right;
          sourceSize.height:parent.height * .6434
          opacity:0
        //    ScaleAnimator{
        //         target: peace;
        //         from: 0;
        //         to: 1;
        //         duration: 1000
        //         running: false
        //         easing.type: Easing.InOutQuad
        // }

       }

       Image {
           id:people
          source:"images/people.svg";
          anchors.right:peace.left
          anchors.rightMargin:parent.width*.25
          sourceSize.height:parent.height *.118
            scale:0


       }
        Image {
           id:earth
          source:"images/earth.svg";
          anchors.left:parent.left
          anchors.top:parent.top
          anchors.topMargin:parent.height * .4
          sourceSize.height:parent.height *.17
          scale:0


       }

       Image {
           id:ocean
          source:"images/ocean.svg";
          anchors.left:parent.left
          anchors.bottom:parent.bottom
          sourceSize.height:parent.height *.25
          anchors.leftMargin:parent.height*.25
          scale:0


    }
    SequentialAnimation {
        running:true

        OpacityAnimator {
        // id: introAnimation
        running: true
        target: peace
        from: 0
        to: 1
        duration: 400
        easing.type: Easing.InOutQuad
    }

         ScaleAnimator{
                target: people;
                from: 0;
                to: 1;
                duration: 300
                running: true
                easing.type: Easing.InOutQuad
        }

        ScaleAnimator{
                target: earth;
                from: 0;
                to: 1;
                duration: 200
                running: true
                easing.type: Easing.InOutQuad
        }

        ScaleAnimator{
                target: ocean;
                from: 0;
                to: 1;
                duration: 50
                running: true
                easing.type: Easing.InOutQuad
        }
    }
   }
  }

 }
 Text{
     id:welcomeText
     text:`Welcome`
     color:"white"
     anchors.horizontalCenter:parent.horizontalCenter
     font.family:"Ubuntu"
     font.pixelSize:24
     anchors.bottom:parent.bottom
     anchors.bottomMargin:parent.height *.1


}
Text{
    id:versionText
     text:`KDE Plasma`
     color:"white"
     anchors.horizontalCenter:parent.horizontalCenter
     font.family:"Ubuntu"
     font.pixelSize:24
     anchors.bottom:parent.bottom
     anchors.bottomMargin:parent.height *.1
     opacity:0

}
SequentialAnimation{
    running:true
OpacityAnimator {
        // id: introAnimation
        running: true
        target: welcomeText
        from: 1
        to: 0
        duration: 5000
        easing.type: Easing.InOutQuad
    }
      OpacityAnimator {
        // id: introAnimation
        running: true
        target: versionText
        from: 0
        to: 1
        duration: 2500
        easing.type: Easing.InOutQuad
    }


}
}
