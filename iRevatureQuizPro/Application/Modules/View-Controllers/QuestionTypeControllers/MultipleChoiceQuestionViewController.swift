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
    
    let answers = [
        QuestionAnswer(id: 123, answer: "Answer 1", explanation: "", order: 1, correct: false, sticky: false),
        QuestionAnswer(id: 132, answer: "Answer 2", explanation: "", order: 2, correct: true, sticky: false),
        QuestionAnswer(id:987, answer: "Some Answer", explanation: "", order: 3, correct: false, sticky: false)
    ]
    
    // Question object to be displayed
    var question: Question?
    
    var questionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configures timer to a number of minutes
		timerLabel.setTimer(with: 45)
        
        timerLabel.runTimer()
        

        tableController.setAnswers(answers: answers)

        currentQuestionLabel.text = String("\(questionIndex + 1)")
        
        questionTextView.text = question?.question

        
        answerTableView.dataSource = tableController
        answerTableView.delegate = tableController
    }
    
    @IBAction func previousQuestionAction(_ sender: Any) {
    }
    
    @IBAction func nextQuestionAction(_ sender: Any) {
    }
    
}
