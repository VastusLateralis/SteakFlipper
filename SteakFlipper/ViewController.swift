//
//  ViewController.swift
//  SteakFlipper
//
//  Created by Thomas Johannessen on 07/08/2018.
//  Copyright © 2018 Thomas Johannessen. All rights reserved.
//

import UIKit

//MARK: App Init
class ViewController: UIViewController { override func viewDidLoad() { super.viewDidLoad() }
    
    
    
    
    
    //MARK: VARIABLES
  
    @IBOutlet weak var AppHeading: UILabel!
    @IBOutlet weak var CookTimeLabel: UILabel!
    @IBOutlet weak var FlipCounterLabel: UILabel!
    @IBOutlet weak var CountDownLabel: UILabel!
    
    var CountDown = 15              // Nedtelling 15 sekunder
    var CookTime = 0                // Total steketid
    var FlipCounter = 0             // Antall "flips"
    var FlipTime = 3                // Stopp i 3 sekunder mens biffen snus
    var ActiveTimer = false         // Skal klokken gå eller stoppe
    
    var SwiftTimer = Timer()
    var SwiftTimerPause = Timer()
    
    
    //MARK: Functions
    
    @objc func updateCounter() {
        CountDownLabel.text = String(CountDown)
        CookTimeLabel.text = "Steketid \(CookTime)"
        FlipCounterLabel.text = "Antall flips \(FlipCounter)"
        
        CountDown -=  1
        CookTime += 1
        
        if CountDown < 0 {  // har telt ned 15 sekunder
            FlipCounter += 1
            // vent 3 sekunder på selve flippen
            //SwiftTimer.invalidate()
            //SwiftTimerPause = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
            
            
            CountDown = 15
            
            
            
            // Her kommer FlipTime pause = 3 sekunder
        }
        
        
    }

    
    @IBAction func biff_StartButton(_ sender: Any) {
        
        if ActiveTimer == false {
            ActiveTimer = true
            SwiftTimer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        }
            
        else {
            if CookTime > 0 {
                SwiftTimer.invalidate()
                ActiveTimer = false
            }
            
        }
        
    }
    
    
    @IBAction func biff_Avslutt(_ sender: Any) {
        
    }
    
    
//MARK: App Exit
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

