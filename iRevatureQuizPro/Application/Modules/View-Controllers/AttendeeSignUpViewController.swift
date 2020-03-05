//
//  AttendeeSignUpViewController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class AttendeeSignUpViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addGradientToView(view: self.view)
    }
    
    @IBAction func backButton(_ sender: Any) {
        let nextVC = MainStoryBoardViewController.instantiate(fromAppStoryboard: AppStoryboard.Main)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: false, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
    }
    
    @IBAction func signUpWithLinkedInButton(_ sender: Any) {
    }
}
