//
//  MultipleChoiceQuestionViewController.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class MultipleChoiceQuestionViewController: BaseViewController {
    
    @IBOutlet weak var currentQuestionLabel: UILabel!
    
    @IBOutlet weak var timerLabel: LabelTimer!
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answerTableView: UITableView!
    
    // Question object to be displayed
    var question: Question?
    
    var questionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configures timer to a number of minutes
        timerLabel.setTimer(duration: 45)
        timerLabel.runTimer()
        
        currentQuestionLabel.text = String(questionIndex)
        
        questionTextView.text = question?.title
        
        
        
        
    }
    
    @IBAction func previousQuestionAction(_ sender: Any) {
    }
    
    @IBAction func nextQuestionAction(_ sender: Any) {
    }
    
}
