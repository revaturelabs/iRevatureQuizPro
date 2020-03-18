//
//  QuizCreateViewController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class CreateQuizViewController: BaseViewController {
    @IBOutlet weak var quizNameTextField: UITextField!
    @IBOutlet weak var tagsTextField: UITextField!
    @IBOutlet weak var activityPointsTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var maxNumberOfAttemptsTextField: UITextField!
    @IBOutlet weak var levelOverrideSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityPointsTextField.keyboardType = .numberPad
        durationTextField.keyboardType = .numberPad
        maxNumberOfAttemptsTextField.keyboardType = .numberPad
    }
    
    @IBAction func optionsButton(_ sender: Any) {
        let nextVC = EmployeeLoginViewController.instantiate(fromAppStoryboard: AppStoryboard.EmployeeLogin)
        easyPresent(nextVC, animated: true, style: .fullScreen)
    }
    
    @IBAction func backButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "EventManagement", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController_ID")
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: false, completion: nil)
    }
    
    @IBAction func submitQuizButtton(_ sender: Any) {
        if !checkAllFieldFilled() { return }
        
        let nextVC = AddQuestionsViewController.instantiate(fromAppStoryboard:AppStoryboard.AddQuestions)
        
        nextVC.quiz = QuizWrapper(quizData: QuizInfo(title: quizNameTextField.text!, levelId: 3, categoryId: 16, noOfAttempts: Int(maxNumberOfAttemptsTextField.text!) ?? 0, passPercentage: 1, mode: "D", quizDuration: 0, description: "Lorem Ipsum"))
        
        easyPresent(nextVC, animated: false, style: .fullScreen)
        
    }
    
    func checkAllFieldFilled() -> Bool {
        if quizNameTextField.text != "" && tagsTextField.text != "" && activityPointsTextField.text != "" { return true }
        return false
    }
    
}
