//
//  MainStoryBoardController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class MainStoryBoardViewController: BaseViewController {
     
    @IBOutlet weak var timer: LabelTimer!
    
    @IBAction func memberLoginButton(_ sender: Any) {
        //check userdefaults for user
        var nextVC: UIViewController
        
        if let user = UserInfoBusinessService.getUserInfo(), user.keepLoggedIn {
            //if user and keep logged in, navigate to event management
            let storyboard = UIStoryboard(name: "EventManagement", bundle: nil)
            nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController_ID")
        } else {
            nextVC = EmployeeLoginViewController.instantiate(fromAppStoryboard: AppStoryboard.EmployeeLogin)
        }
        
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
    @IBAction func attendeeSignUp(_ sender: Any) {
        let nextVC = AttendeeSignUpViewController.instantiate(fromAppStoryboard:AppStoryboard.AttendeeSignUp)
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
    @IBAction func associateLogin(_ sender: Any) {
        
    }
    
    @IBAction func helpScreen(_ sender: Any) {
        let nextVC = HelpViewController.instantiate(fromAppStoryboard:AppStoryboard.Help)
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
      	// var sampleQuiz:QuizAPIData
        

//		QuizDataService.getQuizData()

    
        // Do any additional setup after loading the view.
        
        timer.setTimer(duration: 1)
        timer.runTimer()

    }
    
    
}
