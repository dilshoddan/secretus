//
//  NewNoteViewController.swift
//  secretus
//
//  Created by Home on 2/25/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit
import Speech

class NewNoteViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    let speechRecognizerEN = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))
    let recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    
    var newNoteView: NewNoteView!
    var recordStarted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "New note"
        navigationController?.navigationBar.isHidden = true
        navigationController?.isNavigationBarHidden = true
        RequestAuthorisation()
        SetDefaults()
        AddEvents()
    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            newNoteView.record.isEnabled = true
        }
        else {
            newNoteView.record.isEnabled = false
        }
    }
    
    func RequestAuthorisation(){
        SFSpeechRecognizer.requestAuthorization { (authStatus) in  //4
            
            var isRecordingAllowed = false
            
            switch authStatus {  //5
            case .authorized:
                isRecordingAllowed = true
                
            case .denied:
                isRecordingAllowed = false
                print("User denied access to speech recognition")
                
            case .restricted:
                isRecordingAllowed = false
                print("Speech recognition restricted on this device")
                
            case .notDetermined:
                isRecordingAllowed = false
                print("Speech recognition not yet authorized")
            }
            
            OperationQueue.main.addOperation() {
                self.newNoteView.record.isEnabled = isRecordingAllowed
            }
        }
    }
    
    func SetDefaults(){
        newNoteView = NewNoteView(frame: self.view.bounds)
        self.view.addSubview(newNoteView)
        newNoteView.anchorIn(view: self.view)
    }
    
    func AddEvents(){
        newNoteView.record.addTarget(self, action: #selector(RecordButtonClicked), for: .touchUpInside)
       
        
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc
    func RecordButtonClicked(){
        switch recordStarted {
        case false:
            newNoteView.record.setTitle("Stop Recording", for: .normal)
            newNoteView.record.backgroundColor = UIColor.red
            RecordAndRecognizeSpeech()
            recordStarted = true
        case true:
            if audioEngine.isRunning {
                audioEngine.stop()
                recognitionRequest.endAudio()
            }
            newNoteView.record.setTitle("Start Recording", for: .normal)
            newNoteView.record.backgroundColor = UIColor.green
            recordStarted = false
        default:
            print(recordStarted)
        }
    }
    
    func RecordAndRecognizeSpeech(){
        
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        node.removeTap(onBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            self.recognitionRequest.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        }
        catch {
            print(error)
        }
        
        guard let recognizer = SFSpeechRecognizer() else { return }
        if !recognizer.isAvailable {
            print("Rezognizer for the locale not ready")
            return
        }
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            if let result = result {
                let bestResult = result.bestTranscription.formattedString
                self.newNoteView.note.text = ""
                self.newNoteView.note.text = bestResult
                
            } else if let error = error {
                print(error)
            }
        })
        
    }
        
            
        
        
    
}

