import QtQuick 2.0
Item {
    id: r
    width: a.contentWidth+app.fs
    height: app.fs*2
    clip: true
    opacity: enabled?1.0:0.5
    objectName: 'sin_nombre'
    property bool canceled: false
    property alias text: a.text
    property string t2
    property color c1
    property color c2
    property var objToRunQml
    property string qmlCode:''
    property int speed: 100
    signal click
    Rectangle{
        id: xR1
        color: 'transparent'
        border.width: app.fs*0.1
        border.color: r.c1
        radius: app.fs*0.2
        width: a.contentWidth+app.fs
        height: app.fs*2
        Rectangle{
            id: b3
            opacity: b1.opacity!==0.5?1.0:0.0
            width: parent.width-parent.border.width
            height: parent.height-parent.border.width
            radius: parent.radius
            anchors.centerIn: parent
            color: app.c2
            Behavior on opacity{NumberAnimation{duration:r.speed}}
        }
        Rectangle{
            id: b1
            width: parent.height
            height: parent.width
            radius: parent.radius
            rotation: -90
            anchors.centerIn: parent
            opacity: 0.5
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color:'transparent';
                }
                GradientStop {
                    position: 1.00;
                    color: r.c2;
                }
            }
            Behavior on opacity{NumberAnimation{duration:r.speed*5}}
        }
        Rectangle{
            id: b2
            opacity: 0.5-b1.opacity
            onOpacityChanged: {
                if(opacity>=0.5&&!maBX.p){
                    b1.opacity=0.5
                }
            }
            width: parent.height
            height: parent.width
            radius: parent.radius
            rotation: -270
            anchors.centerIn: parent
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color:'transparent';
                }
                GradientStop {
                    position: 1.00;
                    color: r.c2;
                }
            }
        }
    }
    Text {
        id: a
        font.pixelSize: app.fs
        color: r.c1
        anchors.centerIn: parent
        visible: r.enabled
    }
    Text {
        id: a2
        text:a.text
        font.pixelSize: app.fs
        color: r.c2
        x: !maBX.p?a.x:a.x+2
        y:a.y
        visible: r.enabled
        Behavior on x{NumberAnimation{duration:200}}
        opacity: b3.opacity
    }
    Text {
        id: txtCancel
        text: '<b>?</b>'
        font.pixelSize: app.fs*2
        color: 'red'
        anchors.centerIn: parent
        visible: !r.enabled
    }
    MouseArea{
        id: maBX
        hoverEnabled: true
        anchors.fill: r
        property bool p: false
        onPChanged: {
            if(p){
                if(r.qmlCode===''){
                    click()
                    return
                };
                tBxCancel.restart()}
        }
        onPressed: {
            p=true
            b1.opacity=0.0
        }
        onReleased: {
            p=false
            b1.opacity=0.5
        }
        onClicked: {
            p=false
            b1.opacity=0.5
            if(r.qmlCode===''){
                //click()
                return
            }
            run.start()
        }
    }
    Timer{
        id: run
        interval: r.speed*10
        onTriggered: {
            tBxEnable.start()
            clicked()
            if(r.canceled){return}

            r.runQml(qmlCode)

        }
    }
    Timer{
        id: tBxCancel
        interval: 3000
        onTriggered: {
            r.canceled=true
            r.enabled=false;
            tBxEnable.start();
        }
    }
    Timer{
        id: tBxEnable
        interval: 2000
        onTriggered: {
            r.canceled=false
            r.enabled=true
        }
    }
    function runQml(q){
        var obj = Qt.createQmlObject(q, objToRunQml, 'botonUx-'+r.objectName)
    }
}
