//
//  ViewController.swift
//  SteakFlipper
//
//  Created by Thomas Johannessen on 07/08/2018.
//  Copyright © 2018 Thomas Johannessen. All rights reserved.
//

import UIKit

//MARK: App Init
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
//MARK: Variables
    @IBOutlet weak var biff_Steketid: UILabel!
    @IBOutlet weak var biff_Flips: UILabel!
    @IBOutlet weak var biff_StatusVindu: UILabel!
    
    var second = 60
    var timer = Timer()
    var timerRunning = true
    
    
//MARK: Functions
    
    func setTimer(){
        second  -= 1
        biff_StatusVindu.text = "\(second)"
        if second == 0 {
            timerRunning = false
            timer.invalidate()
        }
    }
    
    
    func timerCounting(){
        if(timerRunning == true){
            timer = Timer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("setTimer"), userInfo: nil, repeats: true)
            timerRunning = true
            if second == 0 {
                timerRunning = false
                timer.invalidate()
            }
        }
    }
    
    
//MARK: Code

    
    
    
    
    
//MARK: App Exit
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

