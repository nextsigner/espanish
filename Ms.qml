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
    property var mMsSil: []
    property var arrayWord: []
    property int uNumSilPlay: 0
    MediaPlayer {
        id: mediaPlayer
        property bool p
        property bool paused
        property int to: 0
        volume: appSettings.volume
        source: 'h/sils-ms/qt-1.4/sil-qt-v1.4.flac'
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
                if(uNumSilPlay!==arrayWord.length-1){
                    uNumSilPlay++
                    playSil(arrayWord[uNumSilPlay])

                }else{
                    uNumSilPlay=0
                }
            }
        }
    }
    Timer{
        id: tSpace
        repeat: false
        running: false
        interval: 600
        onTriggered: {
            if(mediaPlayer.position>=mediaPlayer.to){
                tstop.running=false
                mediaPlayer.stop()
                if(uNumSilPlay!==arrayWord.length-1){
                    uNumSilPlay++
                    playSil(arrayWord[uNumSilPlay])

                }else{
                    uNumSilPlay=0
                }
            }
        }
    }

    function playSil(s){
        if(typeof s === 'string'){
            /*if(s===' '){
                uNumSilPlay++
                tSpace.start()
                return
            }*/
            console.log('PS: '+s)
            mediaPlayer.seek(app.jsonSilabas[s][0])
            mediaPlayer.to=app.jsonSilabas[s][1]
        }else{
            console.log('PS2: '+s)
            var ss=app.arraySilabas[getNumSil(s)]
            console.log('SS: '+ss)
            mediaPlayer.seek(app.jsonSilabas[ss][0])
            mediaPlayer.to=app.jsonSilabas[ss][1]
        }
        tstop.running=true
        mediaPlayer.play()
    }
    function getNumSil(s){
        var n=-1
        for(var i=0;i<app.arraySilabas.length;i++){
            if(s===app.arraySilabas[i]){
                return i;
            }
        }
        return n;
    }
}
