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
        
        //Assigned delegate to control Attendee Signup Table
        table.dataSource = tableSource
        table.delegate = tableSource
    }
    
    //Task bar button to go back
    @IBAction func backButton(_ sender: Any) {
        let nextVC = MainStoryBoardViewController.instantiate(fromAppStoryboard: AppStoryboard.Main)
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
    //Submit Data to Persitance
    @IBAction func submitButton(_ sender: Any) {
        //Check that the data is all there
        guard let signUpData = tableSource.getInputData() else { return }
        EventAttendeePersistenceService.insert(attendeeData: signUpData)
        
        let nextVC = StartQuizViewController.instantiate(fromAppStoryboard: AppStoryboard.StartQuiz)
        easyPresent(nextVC, animated: false, style: .fullScreen)
    }
    
    //Button to signup with LinkedIn instead
    @IBAction func signUpWithLinkedInButton(_ sender: Any) {
    }
}
