//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft":3, "Medium":4, "Hard":7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
//        titleLabel.text = "How do you like your eggs?"
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        }
        else {
            timer.invalidate()
            titleLabel.text = "DONE"
            playSound()
        }
    }
    
    var player = AVAudioPlayer()
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
//    func playsound() {
//        let path = Bundle.main.path(forResource: "alarm_sound", ofType : "mp3")!
//        let url = URL(fileURLWithPath : path)
//        do {
//            player = try AVAudioPlayer(contentsOf: url)
//            player.play()
//        }
//        catch {
//            print ("There is an issue with this code!")
//        }
//    }
    
}
