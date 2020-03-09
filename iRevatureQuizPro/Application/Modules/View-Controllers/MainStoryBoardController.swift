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
        //check userdefaults for user
        let user = UserInfoBusinessService.getUserInfo()
        
        //check user exists and has selected keep log in
        if user == nil || !user!.keepLoggedIn {
            //if no user or user does not want to keep logged in, navigate to login
            let nextVC = EmployeeLoginViewController.instantiate(fromAppStoryboard: AppStoryboard.EmployeeLogin)
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: false, completion: nil)
            
        } else {
            //if user and keep logged in, navigate to event management
            let storyboard = UIStoryboard(name: "EventManagement", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController_ID")
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC,animated: false, completion: nil)
            
        }

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

    }
    
    
}
