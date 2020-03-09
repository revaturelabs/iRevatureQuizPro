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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {

        let nextVC = MainStoryBoardViewController.instantiate(fromAppStoryboard: AppStoryboard.Main)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: false, completion: nil)
    }
    
    @IBAction func signInButton(_ sender: Any) {
        let email = self.emailTextField.text!
        let password = self.passwordTextField.text!
        
        TrainerLoginAccess.getUserLogin(email: email, password: password, completionHandler: { trainerInfo, errorMessage in
            guard let trainer = trainerInfo else {
                self.errorMessage.text = "Invalid username or password"
                return
            }
            
            let user = UserInfo(id: trainer.id, empId: trainer.employeeId, username: trainer.displayEmail, name: trainer.displayFullName, role: trainer.currentSystemRole.name, token: trainer.encryptedLoginToken, keepLoggedIn: self.keepMeLoggedInSwitch.isOn)
            
            UserInfoBusinessService.setUserInfo(userObject: user)
            
            self.navigateToEventManagement()
        })

    }
    
    func navigateToEventManagement() {
        let storyboard = UIStoryboard(name: "EventManagement", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController_ID")
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC,animated: false, completion: nil)
    }
    
}
