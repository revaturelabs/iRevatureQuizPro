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
    var seconds: Int = 0
    
    func setTimer(duration: Int){
        seconds = duration * 60
    }
    
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(LabelTimer.updateTimer)), userInfo: nil, repeats: false)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        self.text = "\(seconds)" //This will update the label.
    }
    
}
