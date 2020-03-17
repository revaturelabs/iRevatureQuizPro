//
//  MultipleSelectionQuestionViewController.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class MultipleSelectionViewController: BaseViewController{
    
    
    @IBOutlet weak var currentQuestionLabel: UILabel!
    
    @IBOutlet weak var timerLabel: LabelTimer!
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answerTableView: UITableView!
    
    
    override func viewDidLoad() {
        // Code here
        timerLabel.setTimer(duration: 45)
        timerLabel.runTimer()
        
    }
    
    
    @IBAction func previousQuestion(_ sender: Any) {
    
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
    
    }
    
}
