import QtQuick 2.0
import QtMultimedia 5.0
import 'PlaySil.js' as PlaySil

Rectangle {
    id: r
    color: "transparent"
    width: app.an
    height: app.fs*2
    property url source: mediaPlayer.source
    property alias mp: mediaPlayer
    property var mMsSil: [[0,500], [500, 1000]]
    MediaPlayer {
        id: mediaPlayer
        property bool p
        property bool paused
        property int to: 0
        volume: appSettings.volume
        source: 'espanish-res/ss_0-115A.m4a'
        onVolumeChanged:{
            if(volume===0){
                //mediaPlayer.position=0
            }
        }
        onPlaying: {
            tstop.running=true
            p=true
            paused=false
        }
        onPaused: {
            p=false
            paused=true
        }
        onStopped: {
            p=false
            paused=false
        }
        onStatusChanged: {
            if(status===MediaPlayer.EndOfMedia){
                //app.verAyuda=true
            }
        }
        onPositionChanged: {
            if(position>=to){
                //volume=0
            }
            //seekSlider.playPosition=position
        }
        onDurationChanged: {
            //mediaPlayer.play()
            //seekSlider.duration = duration

        }
        //Component.onCompleted: app.mp=mediaPlayer
    }

    Text {
        id: txtInfo
        font.pixelSize: app.fs*0.5
        anchors.bottom: r.bottom
        anchors.bottomMargin: app.fs*0.1
        color: app.c4
        text: 'A'
    }
    Timer{
        id: tstop
        repeat: true
        running: false
        interval: 10
        onTriggered: {
            if(mediaPlayer.position>=mediaPlayer.to){
                tstop.running=false
                mediaPlayer.stop()
            }
        }
    }
    function playSil(s){
        mediaPlayer.seek(app.jsonSilabas[s][0])
        mediaPlayer.to=app.jsonSilabas[s][1]
        tstop.running=true
        mediaPlayer.play()
    }
}
