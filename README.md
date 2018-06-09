## PitchPerfect

The Pitch Perfect app is the result of **Intro to iOS App Development with Swift** lesson of **Udacity's iOS Developer Nanodegree** course.

The app allows users to record a sound using the device’s microphone. It then allows users to play the recorded sound back with six different sound modulations: Chipmunk, Vader, Slow, Fast with Reverb and Echo effect.

![RecordSoundsViewController](https://github.com/mirhadiali/PitchPerfect/blob/master/screenShots/record%20screen.png)
![PlaySoundsViewController](https://github.com/mirhadiali/PitchPerfect/blob/master/screenShots/play%20screen.png)

## Implementation

The app has two view controller scenes:

- **RecordSoundsViewController** - consists a record button with a microphone image. Tapping this microphone button 
starts an audio recording session and present a stop button. When the stop button is clicked, the app completes recording and then show the PlaySound controller.

- **PlaySoundsViewController** - contains six buttons to play the recorded sound file with different effects and a button to stop the playback.

The application uses code from `AVFoundation` to record sounds from the microphone (`AVAudioRecorder`) and play recorded audio with effects (`AVAudioPlayer`, `AVAudioEngine`).
