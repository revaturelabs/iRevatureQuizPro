//
//  LabelTimer.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class LabelTimer: UILabel{
    
    var timer = Timer()
    var timeLeft: Int = 0
    
    func setTimer(duration: Int){
        timeLeft = duration * 60
    }
    
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(LabelTimer.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if timeLeft < 1 {
            timer.invalidate()
        }else{
            timeLeft -= 1
            self.text = timeString(time: TimeInterval(timeLeft))
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(timeLeft) / 3600
        let minutes = Int(timeLeft) / 60 % 60
        let seconds = Int(timeLeft) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
}
