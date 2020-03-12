//
//  EmployeeLoginViewController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class EmployeeLoginViewController: BaseViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var keepMeLoggedInSwitch: UISwitch!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var returnMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //check if user has logged in, set user welcome back message
        if let user = UserInfoBusinessService.getUserInfo() {
            emailTextField.text = user.email
            returnMessage.text = "Welcome back \(user.name)"
        }
        
    }
    
    @IBAction func backButton(_ sender: Any) {

        let nextVC = MainStoryBoardViewController.instantiate(fromAppStoryboard: AppStoryboard.Main)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: false, completion: nil)
    }
    
    @IBAction func signInButton(_ sender: Any) {
        //set email and password
        let email = self.emailTextField.text!
        let password = self.passwordTextField.text!
        
        //function to login with API
        TrainerLoginAccess.getUserLogin(email: email, password: password, completionHandler: { trainerInfo, hasError in
            guard let trainer = trainerInfo else {
                //Display error if login fails
                self.errorMessage.text = "Invalid email or password"
                return
            }
            
            //set UserDefaults if log in is successful
            let user = UserInfo(id: trainer.id, empId: trainer.employeeId, email: trainer.displayEmail, name: trainer.displayFullName, role: trainer.currentSystemRole.name, token: trainer.encryptedLoginToken, keepLoggedIn: self.keepMeLoggedInSwitch.isOn)
            
            UserInfoBusinessService.setUserInfo(userObject: user)
            
            //move user to next screen
            self.navigateToEventManagement()
        })

    }
    
    //function to display Event Management storyboard
    func navigateToEventManagement() {
        let storyboard = UIStoryboard(name: "EventManagement", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController_ID")
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC,animated: false, completion: nil)
    }
    
}