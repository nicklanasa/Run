//
//  WorkoutInterfaceController.swift
//  Run!
//
//  Created by Nickolas Lanasa on 11/2/15.
//  Copyright © 2015 Nytek Productions. All rights reserved.
//

import WatchKit
import Foundation


class WorkoutInterfaceController: WKInterfaceController {

    @IBOutlet var workoutTimer: WKInterfaceTimer!
    @IBOutlet var pausePlayButton: WKInterfaceButton!
    
    var paused = false
    var elapsedTime = 0.0
    var startDate = NSDate()
    var duration = 0.0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.duration = context?["minutes"] as! Double
        
        self.startDate = NSDate(timeIntervalSinceNow: self.duration  * 60)
        
        self.workoutTimer.setDate(self.startDate)
        self.workoutTimer.start()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func pauseButtonPressed() {
        if paused {
            self.pausePlayButton.setTitle("Pause")
            
            self.workoutTimer.setDate(NSDate(timeIntervalSinceNow: self.duration - self.elapsedTime))
            
            self.workoutTimer.start()
            self.startDate = NSDate()
        } else {
            let paused = NSDate()
            self.elapsedTime += paused.timeIntervalSinceDate(self.startDate)
            self.pausePlayButton.setTitle("Resume")
            self.workoutTimer.stop()
        }
        
        self.paused = !self.paused
    }
}
