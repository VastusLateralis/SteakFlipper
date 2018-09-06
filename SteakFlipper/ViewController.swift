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


import UIKit

//MARK: App Init
class ViewController: UIViewController { override func viewDidLoad() { super.viewDidLoad() }
    
    
    
    
    
    //MARK: VARIABLES
  
    @IBOutlet weak var StartPauseButton: UIButton!
    @IBOutlet weak var AppHeading: UILabel!
    @IBOutlet weak var CookTimeLabel: UILabel!
    @IBOutlet weak var FlipCounterLabel: UILabel!
    @IBOutlet weak var CountDownLabel: UILabel!
    
    var CountDown = 15              // Nedtelling 15 sekunder
    var CookTime = 0                // Total steketid
    var FlipCounter = 0             // Antall "flips"
    var FlipTime = 3                // Stopp i 3 sekunder mens biffen snus
    var TimerRunning = false         // Skal klokken gå eller stoppe
    
    var SwiftTimer = Timer()
    var SwiftTimerPause = Timer()
    
    
    //MARK: Functions
    
    @objc func updateCounter() {
        CountDownLabel.text = String(CountDown)
        CookTimeLabel.text = myClockString(CookTime)
        FlipCounterLabel.text = "Flip count= \(FlipCounter)"
        
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
        

        
        mm = Int(sender/60)
        ss = sender - mm*60
        
        tt = 0
            

        
        output = "\(tt) : \(mm) : \(ss)"

      return output
    }

    
    @IBAction func StartStoppButton(_ sender: Any) {
        
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

