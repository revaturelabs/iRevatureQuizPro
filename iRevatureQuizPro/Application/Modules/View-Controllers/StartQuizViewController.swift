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
        guard let quizCode = eventCodeTextField.text, EventBusinessService.checkCode(eventCode: quizCode) else { return }
        
        let nextVC = AttendeeSignUpViewController.instantiate(fromAppStoryboard: AppStoryboard.AttendeeSignUp)
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let alert = UIAlertController(title: "Start Quiz", message: "Feature coming soon", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Acknowledge", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}
