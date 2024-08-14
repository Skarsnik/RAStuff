import QtQuick 2.15
import QtQuick.Controls
import fr.nyo.RAEngine 1.0
import QtTextToSpeech

Window {
    //required property RAEngine mainEngine;
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "todelete"

    MainScreen {
        id: mainScreen
    }

    // This are the events that can happen
    Connections {
        target : MainEngine

        // The session is started
        function onSessionStarted() {
            tts.say("RetroAchievements session started");
        }
        // When an achievement is unlocked
        function onAchievementAchieved(achievement) {
            console.log("Achievement unlocked " + achievement.title);
            tts.say("Achievement unlocked : " + achievement.title);
        }
        // When the logged request is done,
        // Check success to see if logged or not
        function onLoginDone(success) {

        }
    }
    TextToSpeech {
        id : tts
        Component.onCompleted: {
            var voices = tts.availableVoices();
            tts.voice = voices[Math.floor(Math.random() * voices.length)];
        }
    }
}
