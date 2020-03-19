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
    
    public var questionList: [TakeQuizQuestion]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configures timer to a number of minutes
        timerLabel.runTimer()
        
        //Sets the question label
        currentQuestionLabel.text = String("\(questionIndex + 1)")
        
        //Fills the table controller with necessary information
        tableController.setAnswers(answers: question!.answers)
        tableController.currentQuestion = questionIndex
        
        //Set the Text of the question
        questionTextView.text = question?.question
        
        //Assign delegate table controller
        answerTableView.dataSource = tableController
        answerTableView.delegate = tableController
    }
    
    
    @IBAction func previousQuestionAction(_ sender: Any) {
        
    }
    
    @IBAction func nextQuestionAction(_ sender: Any) {
        
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let alert = UIAlertController(title: "Submitting the Quiz", message: "Please check that you answered all questions before continuing", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            let nextVC = QuizCompletionViewController.instantiate(fromAppStoryboard: AppStoryboard.QuizCompletion)
            nextVC.modalPresentationStyle = .fullScreen
            nextVC.results(score: AttendeeQuizService.getQuizPercentage() , minimumscore: 70.0, title: "title")
            self.present(nextVC, animated: false, completion: nil)
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
