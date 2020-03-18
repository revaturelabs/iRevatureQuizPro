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

    var newQuizArray = [QuizAPIData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //creates the database table for Events
        Database.create(table: Events.table)
        dateTextField.dateSelector()

        QuizAPI.getAllQuizzes(numberOfRecords: 1000000000) { (allQuizzes) in
            self.newQuizArray = allQuizzes
            self.quizIDTextField.pickerSelector(data: allQuizzes.map({$0.title}))
        }
        
//        quizArray = ["Quiz 1", "Quiz 2", "Quiz 3", "Quiz 4"]
        //quizArray  = ["Quiz 1", "Quiz 2", "Quiz 3", "Quiz 4"]
        quizIDTextField.pickerSelector(data: ["Loading"])
        // Assigns the quiz a list of values to select from
//        quizTextField.pickerSelector(data: quizArray)

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
        if !validateFields() { return }
        
        let DF = DateFormatter()
        DF.dateFormat = "MMM dd, yyyy"
        let date = DF.date(from: dateTextField.text!)
        guard let quizID = getQuizIDByName(quizName: quizIDTextField!.text!) else { return }
        
        Events.insert(eventName: eventNametextField.text!, location: locationTextField.text!, eventCode: eventCodeTextField.text!, quizID: quizID, ambassadorEmail: ambassadorEmailTextField.text!, date: date!)
        self.dismiss(animated: true, completion: nil)
    }
    
    func validateFields() -> Bool {
        var valid = true
        var invalidString = ""
        
        if quizIDTextField.text == "Loading" { invalidString += "Quiz Field is still loading. Please Wait.\n\n"; valid = false }
        
        if eventCodeTextField.text == "" { invalidString += "Please Input a Valid Event Code\n"; valid = false }
        if eventNametextField.text == "" { invalidString += "Please Input a Valid Event Name\n"; valid = false }
        if locationTextField.text == "" { invalidString += "Please Input a Valid Location\n"; valid = false }
        if ambassadorEmailTextField.text == "" || !ValidationUtilities.isValidEmail(ambassadorEmailTextField!.text!) { invalidString += "Please Input a Valid Ambassador Email\n"; valid = false }
        
        if !valid { showInvalidTextField(message: invalidString) }
        
        return valid
    }
    
    func showInvalidTextField(message: String) {
        let alert = UIAlertController(title: "Invalid Input", message: "", preferredStyle: .alert)
        alert.message = message
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
    func getQuizIDByName(quizName: String) -> String? {
        if newQuizArray.isEmpty { return nil }
        
        for quiz in newQuizArray {
            if quiz.title == quizName { return "\(quiz.id)" }
        }
        
        return nil
    }
    
}
