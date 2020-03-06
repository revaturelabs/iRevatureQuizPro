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
    @IBOutlet weak var levenOverrideSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func optionsButton(_ sender: Any) {
    }
    
    @IBAction func backButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "EventManagement", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController_ID")
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: false, completion: nil)
    }
    
}
