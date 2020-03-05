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
        
        addGradientToView(view: self.view)
        eventInputTable.dataSource = self
        eventInputTable.delegate = self
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
            cell.textInput.dateSelector(dateFormat: "MMM dd, yyyy")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    
}
