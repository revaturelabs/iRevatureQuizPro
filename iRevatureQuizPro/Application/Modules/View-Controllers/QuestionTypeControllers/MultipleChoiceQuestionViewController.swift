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
        timerLabel.runTimer()

        tableController.setAnswers(answers: question!.answers)

        currentQuestionLabel.text = String("\(questionIndex + 1)")
        
        questionTextView.text = question?.question

        answerTableView.delegate = tableController
    }
    
    @IBAction func previousQuestionAction(_ sender: Any) {
        
            
//            UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IKDetailVC") as? IKDetailVC
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func nextQuestionAction(_ sender: Any) {
        
//        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
//
//        //Make sure that the view controller is properly instantiated
//        guard let controller = instance.instantiateViewController(withIdentifier: storyboardID) as?
        
//        let vc = UIStoryboard.init(name: "QuizQuestions", bundle: Bundle.main).instantiateViewController(withIdentifier: "QuestionPageViewController_ID") as! QuestionPageViewController
//        
//        vc.getViewControllerAtIndex(index: 0)
    }
    
}
