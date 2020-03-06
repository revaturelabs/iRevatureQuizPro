//
//  QuizViewViewController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class QuizViewViewController: BaseViewController {
    
    @IBOutlet weak var quizSearchBar: UISearchBar!
    @IBOutlet weak var managementTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func optionsButton(_ sender: Any) {

    }
    
    @IBAction func createQuizButton(_ sender: Any) {
        let nextVC = CreateQuizViewController.instantiate(fromAppStoryboard: AppStoryboard.QuizManagement)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: false, completion: nil)
    }
    
}
