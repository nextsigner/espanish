import QtQuick 2.0
import QtQuick.Controls 1.4
import  "../../../"
import '../../../Silabas.js' as Sil
Item {
    id: r
    width: app.an
    height: app.al
    //Marco{}
    onVisibleChanged: {
        if(visible){
            //app.mp.source="./a1.m4a"
            //app.pa=pa
        }
    }

    Rectangle{
        id: xRowSetSil
        z:flickableSetSil.z+1
        width: rowSetSil.width+app.fs*0.5
        height: app.fs*2.5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: r.top
        anchors.topMargin: app.fs*0.25
        radius: app.fs*0.25
        color:app.c3
        border.color: app.c2
        border.width: 2
        Row{
            id: rowSetSil
            anchors.centerIn: parent
            spacing: app.fs*0.5
            Text{text:'Inicio: ';color: app.c2;font.pixelSize: app.fs;anchors.verticalCenter: parent.verticalCenter}
            SpinBox{//QtQuick.Controls 1.4
                id: sbFrom
                width: app.fs*6
                value:0
                stepSize: 1000
                minimumValue: 0
                maximumValue: sbTo.to-10
                font.pixelSize: app.fs
                decimals: 0
                anchors.verticalCenter: parent.verticalCenter
            }
            Text{text:'Fin: ';color: app.c2;font.pixelSize: app.fs;anchors.verticalCenter: parent.verticalCenter}
            SpinBox{//QtQuick.Controls 1.4
                id: sbTo
                width: app.fs*6
                value:1000
                stepSize: 1000
                minimumValue: 0
                maximumValue:  ms.mp.duration
                font.pixelSize: app.fs
                decimals: 0
                anchors.verticalCenter: parent.verticalCenter
            }
            BotonUX{
                id: botSetMsSil
                text: '¿?'
                c1:app.c2
                c2:app.c3
                speed: 100
                clip: false
                onClick: {
                    var d=''+sbFrom.value+' '+sbTo.value
                    unik.setFile('silabas_ajustadas/'+text, d)
                }
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
    Flickable{
        id: flickableSetSil
        width: gridSil.width
        height: r.height-xRowSetSil.height-app.fs*2
        anchors.horizontalCenter:  r.horizontalCenter
        anchors.top: xRowSetSil.bottom
        anchors.topMargin: app.fs
        contentWidth: gridSil.width
        contentHeight: gridSil.height
        Marco{}
        Grid{
            id: gridSil
            columns: 9
            spacing: app.fs*0.25
            width:  (columns*app.fs*3)+(spacing*(columns-1))
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater{
                id: repSil
                model: ['a', 'e', 'a']
                Item{
                    width: app.fs*3
                    height: app.fs*2
                    BotonUX{
                        anchors.centerIn: parent
                        text: modelData
                        c1:parseInt(app.jsonSilabas[modelData][0])===-1?'red':app.c2
                        c2:parseInt(app.jsonSilabas[modelData][0])===-1?'yellow':app.c3
                        speed: 50
                        //enabled: parseInt(app.jsonSilabas[modelData][0])===-1
                        clip: false
                        onClick: {
                            tReqAbierto.v++
                            tReqAbierto.restart()
                            focus= true
                            ms.playSil(modelData)
                            sbTo.to=ms.mp.duration
                        }
                        Timer{
                            id: tReqAbierto
                            running: false
                            repeat: false
                            interval: 500
                            property int v: 0
                            onTriggered: {
                                if(v>=2){
                                    parent.abierto=!parent.abierto
                                }
                                v=0
                            }
                        }
                        property bool abierto: false
                        focus: true
                        Keys.onSpacePressed: {
                            if(!unik.fileExist('silabas_ajustadas/'+modelData+'')){
                                sbFrom.value=sbTo.value
                                sbTo.value=sbTo.value+600
                            }else{
                                var s=''+unik.getFile('silabas_ajustadas/'+modelData+'')
                                var m0=s.split(' ')
                                sbFrom.value=parseInt(m0[0])
                                sbTo.value=parseInt(m0[1])
                            }
                            botSetMsSil.text=modelData
                        }
                        Keys.onRightPressed: {
                            ms.mp.stop()
                            sbFrom.value+=1
                        }
                        Keys.onLeftPressed: {
                            ms.mp.stop()
                            sbFrom.value-=1
                        }
                        Keys.onUpPressed: {
                            ms.mp.stop()
                            sbTo.value+=1
                        }
                        Keys.onDownPressed: {
                            ms.mp.stop()
                            sbTo.value-=1
                        }
                        Keys.onReturnPressed:  {
                            ms.mp.seek(sbFrom.value)
                            ms.mp.to=sbTo.value
                            ms.mp.play()
                        }
                        Rectangle{
                            id: rect
                            width: parent.width
                            height: parent.height
                            color: 'transparent'
                            border.width: 4
                            border.color: 'yellow'
                            anchors.centerIn: parent
                            visible: parent.abierto
                        }
                    }
                }
            }
        }
    }


    Component.onCompleted: {
        var carpetaSA='silabas_ajustadas'
        unik.mkdir(carpetaSA)

        repSil.model=Sil.silabas
        sbTo.maximumValue=ms.mp.duration
        sbTo.value=sbTo.maximumValue
        controles.visible=false
    }
}
