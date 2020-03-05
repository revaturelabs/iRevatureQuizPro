//
//  MainStoryBoardController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class MainStoryBoardViewController: BaseViewController {
     
    @IBAction func memberLoginButton(_ sender: Any) {
        present(EmployeeLoginViewController.instantiate(fromAppStoryboard: AppStoryboard.EmployeeLogin),animated: false,completion: nil)
        

    }
    
    @IBAction func attendeeSignUp(_ sender: Any) {
        let nextVC = AttendeeSignUpViewController.instantiate(fromAppStoryboard:AppStoryboard.AttendeeSignUp)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: false, completion: nil)
    }
    
    @IBAction func associateLogin(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addGradientToView(view: self.view)
    }
    
    
}
