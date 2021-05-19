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
    
    let eggTimes = [
        "Soft":3,
        "Medium":5,
        "Hard":7
    ]
    var secondsTotal = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var lblText: UILabel!
    
    
    @IBOutlet weak var progress: UIProgressView!
    
    var timer = Timer()
    
    @IBAction func keyPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        lblText.text = hardness
        secondsTotal = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats:true)
    }
    
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
    
    @objc func updateTimer(){
        if secondsPassed < secondsTotal {
            secondsPassed += 1
            progress.progress = Float(secondsPassed) / Float(secondsTotal)
            print(secondsPassed)
            print(Float(secondsPassed) / Float(secondsTotal))
            
        }else{
            timer.invalidate()
            progress.progress = 0.1
            lblText.text = "Done"
            playSound()
            secondsPassed = 0
            secondsTotal = 0
        }
    }
}
