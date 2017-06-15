//
//  ViewController.swift
//  Back to Bach
//
//  Created by Tyler McGee on 6/6/17.
//  Copyright © 2017 Tyler McGee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "sheep", ofType: "mp3")
    var timer = Timer()
    
    func updateScrubber () {
        
        scrubber.value = Float(player.currentTime)
        
    }

    @IBAction func playButton(_ sender: Any) {
        
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func volumeChanged(_ sender: Any) {
        
        player.volume = volume.value
        
    }
    
    @IBAction func scrubberMoved(_ sender: Any) {
        
        player.currentTime = TimeInterval(scrubber.value)
        
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        
        player.pause()
        
        timer.invalidate()
        
    }

    @IBAction func stopButton(_ sender: Any) {
        
        scrubber.value = 0
        
        timer.invalidate()
        
        player.pause()
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            
        } catch {
            
            // process error
        }

    }
    
    @IBOutlet weak var volume: UISlider!
    
    @IBOutlet weak var scrubber: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            scrubber.maximumValue = Float(player.duration)
            
            
        } catch {
            
            // process error
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

