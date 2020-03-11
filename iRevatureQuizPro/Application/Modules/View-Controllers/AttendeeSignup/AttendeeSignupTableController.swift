//
//  AttendeeSignupTableController.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class AttendeeSignupTableController: UITableViewController {
    
    //Input field names
    private let inputFieldNames: [String] = ["First Name",
                                             "Last Name",
                                             "Email",
                                             "Phone Number",
                                             "Major",
                                             "Highest Level of Education",
                                             "Work Authorization"]
    
    //Hold reference to all the cells in the table to get data from later
    private var cells: [String : AttendeeSignupTableCell] = [String : AttendeeSignupTableCell]()

    //Set how many cells are going to be in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputFieldNames.count
    }
    
    //Setup cells in table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AttendeeSignupTableCell.cellIdentifier, for: indexPath) as! AttendeeSignupTableCell
        
        cell.setTextInput(name: "\(inputFieldNames[indexPath.row])*")
        if inputFieldNames[indexPath.row] == "Email" {
            cell.setKeyboard(keyboardType: .emailAddress)
        }
        if inputFieldNames[indexPath.row] == "Phone Number" {
            cell.setKeyboard(keyboardType: .numberPad)
        }
        
        cells[inputFieldNames[indexPath.row]] = cell
        
        return cell
    }
    
    //Set height for each cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AttendeeSignupTableCell.cellHeight
    }
    
    //Get data from cells
    func getInputData() -> BEventAttendeeSignUpInputData? {
        var signUpInput = BEventAttendeeSignUpInputData()
        
        for index in 0...6 {
            guard let value = cells[inputFieldNames[index]]?.getInput() else { return nil }
            if !signUpInput.input(atIndex: index, value: value) { return nil }
        }
        
        return signUpInput
    }
        
}
