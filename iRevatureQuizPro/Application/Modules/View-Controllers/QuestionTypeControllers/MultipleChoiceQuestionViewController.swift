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
    private let tableController = MultipleChoiceQuestionTableController()
    
    override func viewDidLoad() {
        // Your coce here
        timerLabel.setTimer(duration: 45)
        timerLabel.runTimer()
        
        answerTableView.dataSource = tableController
        answerTableView.delegate = tableController
    }
    
    @IBAction func previousQuestionAction(_ sender: Any) {
    }
    
    @IBAction func nextQuestionAction(_ sender: Any) {
    }
    
}
