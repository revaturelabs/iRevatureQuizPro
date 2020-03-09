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
    
    let tableCellIdentifier: String = "CreateEventCell"
    let inputNames: [String] = ["Event Code", "Event Name", "Location", "Date", "Quiz", "Ambassador"]
    let quizArray: [String] = ["Quiz 1", "Quiz 2", "Quiz 3", "Quiz 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "EventManagement", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController_ID")
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: false, completion: nil)
    }
    
    @IBAction func submitEventButton(_ sender: Any) {
        let alert = UIAlertController(title: "Create Event", message: "Feature coming soon", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Acknowledge", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }
}

extension CreateEventViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! CreateEventTableCell
        
        cell.setFieldName(name: inputNames[indexPath.row])
        if inputNames[indexPath.row] == "Quiz" {
            cell.textInput.pickerSelector(data: quizArray)
        }
        if inputNames[indexPath.row] == "Date" {
            cell.textInput.dateSelector()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    
}
