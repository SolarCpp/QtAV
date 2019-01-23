import QtQuick 2.0

Item {
    id: root
    anchors.fill:parent

    property var source: null
    property var showInfo: false

    Rectangle{
        id:subtitle
        anchors.centerIn: parent
        width: source.outRect.width*0.9
        height: source.outRect.height*0.9
        color: "transparent"
        border.color: "#f0f0f0"
        border.width: 1

    }
    Rectangle{
        id:video
        anchors.centerIn: parent
        width: source.outRect.width*0.95
        height: source.outRect.height*0.95
        color: "transparent"
        border.color: "#f0f0f0"
        border.width: 1

    }
    Rectangle{
        id:ref
        anchors.centerIn: parent
        width: source.outRect.width*0.9
        height: source.outRect.height*0.9
        visible: false
    }
    Text{
        id:info
        anchors.fill: ref
        color:"white"
    }
    Text{
        id:info2
        anchors.left: ref.left
        anchors.bottom: ref.bottom
        anchors.margins: 5
        color:"white"
        font.pixelSize: 20
    }

    function show(metaData){
        if(source!==null && !!metaData){
            root.getInfo(metaData)
            root.getInfo2(metaData)

        }

    }
    function splitAndRound(a, n) {
        a = a * Math.pow(10, n);
        return (Math.round(a)) / (Math.pow(10, n));
    }

    function getInfo2(metaData){
        if(source.hasVideo){
            var text = ""
            text = "%1x%2 %3 缩放:%4 倍速:%5".arg(metaData.resolution.width)
             .arg(metaData.resolution.height)
             .arg(metaData.pixelFormat)
             .arg(root.splitAndRound(source.outRect.height/metaData.resolution.height,2))
             .arg(root.splitAndRound(source.playbackRate,1))

            info2.text = text
        }
        else
          info2.text = ""


    }


    function getInfo(metaData){

        if(showInfo){
            var text = "<p>" + source.source + "</p>"
            if (typeof metaData.duration != "undefined") {
                text += "<p>" + qsTr("Duration: ")
                if (metaData.startTime > 0)
                    text += metaData.startTime + "+"
                text += metaData.duration + " ms</p>"
            }
            if (typeof metaData.size != "undefined")
                text += "<p>" + qsTr("Size: ") + Math.round(metaData.size/1024/1024*100)/100 + " M</p>"
            if (typeof metaData.title != "undefined")
                text += "<p>" + qsTr("Title") + ": " +metaData.title + "</p>"
            if (typeof metaData.year != "undefined")
                text += "<p>" + qsTr("Year") + ": " + metaData.year + "</p>"
            if (typeof metaData.date != "undefined")
                text += "<p>" + qsTr("Date") + ": " + metaData.date + "</p>"
            if (typeof metaData.trackNumber != "undefined")
                text += "<p>" + qsTr("Track") + ": " + metaData.trackNumber + "</p>"
            if (typeof metaData.trackCount != "undefined")
                text += "<p>" + qsTr("Track count") + ": " + metaData.trackCount + "</p>"

            if (source.hasVideo) {
                text += "<h4>" + qsTr("Video") + "</h4>"
                        + "<p>" + qsTr("Resolution") + ": " + metaData.resolution.width + "x" +  + metaData.resolution.height
                        + "</p><p>" + qsTr("Bit rate") + ": " + metaData.videoBitRate
                        + "</p><p>" + qsTr("Codec") + ": " + metaData.videoCodec
                        + "</p><p>" + qsTr("Pixel format") + ": " + metaData.pixelFormat
                        + "</p><p>" + qsTr("Frames") + ": " + metaData.videoFrames + ", " + qsTr("Frame rate") + ": " + Math.round(100*metaData.videoFrameRate)/100 + "</p>"


            }
            if (source.hasAudio) {
                text += "<h4>" + qsTr("Audio") + "</h4>"
                        + "<p>" + qsTr("Codec") + ": " + metaData.audioCodec
                        + "</p><p>" + qsTr("Sample format") + ": " + metaData.sampleFormat
                        + "</p><p>" + qsTr("Sample rate") + ": " + metaData.sampleRate
                        + "</p><p>" + qsTr("Channels") + ": " + metaData.channelCount + " (" + metaData.channelLayout + ")"
                        + "</p><p>" + qsTr("Bit rate") + ": " + metaData.audioBitRate
                + "</p>"
            }
            info.text = text

        }
        else{
            info.text = ""

        }


    }

}
