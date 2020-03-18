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
    private let tableController = MCQuestionTableController()
    
    // Question object to be displayed
    var question: TakeQuizQuestion?
    
    var questionIndex: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configures timer to a number of minutes
		timerLabel.setTimer(with: 45)
        
        timerLabel.runTimer()
        
        // Appends the set of answers to the table view
        tableController.setAnswers(answers: question!.answers)

        currentQuestionLabel.text = String("\(questionIndex + 1) / 10")
        
        questionTextView.text = question?.question

        
        answerTableView.dataSource = tableController
        answerTableView.delegate = tableController
    }
    
    @IBAction func previousQuestionAction(_ sender: Any) {
    }
    
    @IBAction func nextQuestionAction(_ sender: Any) {
    }
    
}
