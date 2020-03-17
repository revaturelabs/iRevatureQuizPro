//
//  TimerLabel.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

//class that turns label into a timer
class LabelTimer: UILabel{
    
    var timer = Timer()
    var timeLeft: Int = 0
    
    //sets the duration of the timer in minutes
    func setTimer(duration: Int){
        timeLeft = duration * 60
    }
    
    //starts the timer and repeats counting
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(LabelTimer.updateTimer)), userInfo: nil, repeats: true)
    }
    
    //updates the timer with the time left and checks if there is no time left
    @objc func updateTimer() {
        if timeLeft < 1 {
            timer.invalidate()
        }else{
            timeLeft -= 1
            self.text = timeString(time: TimeInterval(timeLeft))
        }
    }
    
    //formats the time remaining into a timer to display on the label
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(timeLeft) / 60 % 60
        let seconds = Int(timeLeft) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
}
