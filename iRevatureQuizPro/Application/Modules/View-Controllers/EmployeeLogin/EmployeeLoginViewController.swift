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
                self.showToast(message: "Invalid email or password")
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
    
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/8, y: self.view.frame.size.height/2, width: 300, height: 50))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.red
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 8.0, delay: 4, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
