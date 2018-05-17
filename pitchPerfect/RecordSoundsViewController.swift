//
//  RecordSoundsViewController.swift
//  pitchPerfect
//
//  Created by Weekend on 4/29/18.
//  Copyright © 2018 Weekend. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
 var audioRecorder : AVAudioRecorder!
    
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //stopButton.isEnabled = false
        configureUI()
    }
  
    func configureUI(rB enable: Bool? = true, sB disable: Bool? = false, text:String? = "Tap to record"){
        recordButton.isEnabled = enable!
        recordLabel.text = text
        stopButton.isEnabled = disable!
        
    }

    @IBAction func stopButton(_ sender: Any) {
        configureUI()
        /* recordButton.isEnabled = true
        recordLabel.text = "Tap to record"
        stopButton.isEnabled = false */
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    
    @IBAction func recordButton(_ sender: Any) {
        
      
        configureUI(rB: false, sB: true, text: "Recoding in progress")
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
     
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder =  AVAudioRecorder(url: filePath!, settings: [:])
        
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
            }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "playSoundScreen", sender: audioRecorder.url)
        }
        else {
            print("Recording failed")
        }

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playSoundScreen" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    
}

