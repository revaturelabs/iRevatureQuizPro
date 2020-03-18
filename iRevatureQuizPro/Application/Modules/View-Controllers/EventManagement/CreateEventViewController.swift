//
//  CreateEventViewController.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/4/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class CreateEventViewController: BaseViewController {
    

    @IBOutlet weak var eventInputTable: UITableView!

    

    private var quizDropdown: DropdownPicker?
    
    var quizArray: [String] = []
    //    let tableCellIdentifier: String = "CreateEventCell"
    //    let inputNames: [String] = ["Event Code", "Event Name", "Location", "Date", "Quiz", "Ambassador"]
    //    let quizArray: [String] = ["Quiz 1", "Quiz 2", "Quiz 3", "Quiz 4"]

    @IBOutlet weak var eventCodeTextField: UITextField!
    @IBOutlet weak var eventNametextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var quizIDTextField: UITextField!
    @IBOutlet weak var ambassadorEmailTextField: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //creates the database table for Events
        Database.create(table: Events.table)
        dateTextField.dateSelector()

        


//        quizArray = ["Quiz 1", "Quiz 2", "Quiz 3", "Quiz 4"]
        quizArray  = ["Quiz 1", "Quiz 2", "Quiz 3", "Quiz 4"]
        
        // Assigns the quiz a list of values to select from
//        quizTextField.pickerSelector(data: quizArray)
        quizIDTextField.pickerSelector(data: quizArray)

    }
    
    //returns user back to the events view screen
    @IBAction func backButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "EventManagement", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController_ID")
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: false, completion: nil)
    }
    
    //Inserts a new row into the database based on the form on the view
    @IBAction func submitEventButton(_ sender: Any) {
        let DF = DateFormatter()
        DF.dateFormat = "MMM dd, yyyy"
        let date = DF.date(from: dateTextField.text!)
        Events.insert(eventName: eventNametextField.text!, location: locationTextField.text!, eventCode: eventCodeTextField.text!, quizID: quizIDTextField.text!, ambassadorEmail: ambassadorEmailTextField.text!, date: date!)
        self.dismiss(animated: true, completion: nil)
    }
    
}
