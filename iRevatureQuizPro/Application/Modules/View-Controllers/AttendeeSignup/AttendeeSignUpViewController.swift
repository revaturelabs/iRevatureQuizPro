//
//  AttendeeSignUpViewController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class AttendeeSignUpViewController: BaseViewController {

    @IBOutlet weak var textTest: UITextField!
    
    @IBOutlet weak var table: UITableView!
    private let tableSource = AttendeeSignupTableController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = tableSource
        table.delegate = tableSource
    }
    
    @IBAction func backButton(_ sender: Any) {
        let nextVC = MainStoryBoardViewController.instantiate(fromAppStoryboard: AppStoryboard.Main)
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        guard let signUpData = tableSource.getInputData() else { return }
        EventAttendeePersistenceService.insert(attendeeData: signUpData)
        
        let nextVC = StartQuizViewController.instantiate(fromAppStoryboard: AppStoryboard.StartQuiz)
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
    @IBAction func signUpWithLinkedInButton(_ sender: Any) {
    }
}
