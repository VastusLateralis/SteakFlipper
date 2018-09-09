//
//  ViewController.swift
//  SteakFlipper
//
//  Created by Thomas Johannessen on 07/08/2018.
//  Copyright © 2018 Thomas Johannessen. All rights reserved.
//
// Lage 00:00:00 klokke
// Spille lyd når det skal snus
// Stoppe nedtellingen i 3 sekunder når det snus


//MARK: App Init

import UIKit
import AVKit
import AVFoundation

extension ViewController {
    //manage rotation for this viewcontroller
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    //MARK: VARIABLES
  
    @IBOutlet weak var StartPauseButton: UIButton!
    @IBOutlet weak var AppHeading: UILabel!
    @IBOutlet weak var CookTimeLabel: UILabel!
    @IBOutlet weak var FlipCounterLabel: UILabel!
    @IBOutlet weak var CountDownLabel: UILabel!
    
    var CountDown = 15              // Nedtelling 15 sekunder
    var CookTime = 0             // Total steketid
    var FlipCounter = 0             // Antall "flips"
    var FlipTime = 3                // Stopp i 3 sekunder mens biffen snus
    var TimerRunning = false        // Skal klokken gå eller stoppe
    
    var SwiftTimer = Timer()
    var SwiftTimerPause = Timer()

    var player = AVPlayer()
    
    
    @IBAction func localPress(_ sender: Any) {

    }

    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: Functions
    
    @objc func updateCounter() {
        CountDownLabel.text = String(CountDown)
        CookTimeLabel.text = myClockString(CookTime)
        FlipCounterLabel.text = " \(FlipCounter) Flips"
        
        CountDown -=  1
        CookTime += 1
        
        if CountDown < 0 {  // har telt ned 15 sekunder
            FlipCounter += 1
            CountDown = 15
        }
        
    }
    
    
    func myClockString(_ sender: Int) -> String  {
        
        var output : String

        var tt: Int = 0
        var mm: Int = 0
        var ss: Int = 0
        
        var ss_string : String
        var mm_string : String
        var tt_string : String
        
        
        tt = Int (sender/3600)
        mm = Int (sender/60) - tt*60
        ss = Int (sender - tt*3600 - mm*60)
        
        if tt < 10 { tt_string = "0"} else {tt_string = ""}
        if mm < 10 { mm_string = "0"} else {mm_string = ""}
        if ss < 10 { ss_string = "0"} else {ss_string = ""}

        output = "\(tt_string)\(tt) : \(mm_string)\(mm) : \(ss_string)\(ss)"

      return output
    }

    
    @IBAction func StartStoppButton(_ sender: Any) {
        
        let path = Bundle.main.resourcePath!+"/Ding.mp3"
        print(path)
        let url = URL(fileURLWithPath: path)
        
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        player.play()
        
        if TimerRunning  {
            SwiftTimer.invalidate() // Stopp klokken
            TimerRunning = false
            StartPauseButton.setTitle("Paused", for: .normal)
        } else {
            SwiftTimer = Timer.scheduledTimer(timeInterval: 1, target:self, selector:  #selector(ViewController.updateCounter), userInfo: nil, repeats: true) // Start klokken
            TimerRunning = true
            StartPauseButton.setTitle("Cooking", for: .normal)
            
        }
        
    }
    
    
    @IBAction func biff_Avslutt(_ sender: Any) {
        
    }
    
    
//MARK: App Exit
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()

    }


}

