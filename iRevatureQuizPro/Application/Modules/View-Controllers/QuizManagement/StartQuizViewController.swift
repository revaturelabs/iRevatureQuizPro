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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func backbutton(_ sender: Any) {
        let nextVC = AttendeeSignUpViewController.instantiate(fromAppStoryboard: AppStoryboard.AttendeeSignUp)
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        #warning("Remember To uncomment for validation")
//        guard let quizCode = eventCodeTextField.text, EventBusinessService.checkCode(eventCode: quizCode) else { return }

        let nextVC = QuestionPageViewController.instantiate(fromAppStoryboard:AppStoryboard.QuizQuestions)
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
}
