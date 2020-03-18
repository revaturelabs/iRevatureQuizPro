//
//  StartQuizViewController.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class StartQuizViewController: BaseViewController {
    
    @IBOutlet weak var eventCodeTextField: UITextField!
    
    /// - Note: Stores all quizzes from  API call
    var allQuizzes = [QuizAPIData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// - Note: Ran on loading of Page to get all quizzes from API
        QuizAPI.getAllQuizzes(numberOfRecords: 250, finish: {(allQuizzes) in
            self.allQuizzes = allQuizzes
        })
    }

    @IBAction func backbutton(_ sender: Any) {
        let nextVC = AttendeeSignUpViewController.instantiate(fromAppStoryboard: AppStoryboard.AttendeeSignUp)
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        //Checks to make sure that all quizes have been fetched and that there is a matching ID to fetched quizzes

        guard !allQuizzes.isEmpty, let quizID = getQuizID() else { return }

        AttendeeQuizService.fetchCurrentQuiz(quizId: quizID)

        let nextVC = QuestionPageViewController.instantiate(fromAppStoryboard:AppStoryboard.QuizQuestions)
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
    //Checked all quizzes by name and returns the Quiz ID
    func getQuizID() -> Int? {
        for quiz in self.allQuizzes {
            if quiz.title == eventCodeTextField.text! { return quiz.id }
        }
        
        return nil
    }
    
}
