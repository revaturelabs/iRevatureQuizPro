//
//  AttendeeSignupTableController.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class AttendeeSignupTableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let inputFieldNames: [String] = ["First Name",
                                             "Last Name",
                                             "Email",
                                             "Phone Number",
                                             "Major",
                                             "Highest Level of Education",
                                             "Work Authorization"]
    
    private var cells: [String : AttendeeSignupTableCell] = [String : AttendeeSignupTableCell]()

    //Table funcs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputFieldNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AttendeeSignupTableCell.cellHeight
    }
    
    //Data func
    func getInputData() -> BEventAttendeeSignUpInputData? {
        var signUpInput = BEventAttendeeSignUpInputData()
        
        for index in 0...6 {
            guard let value = cells[inputFieldNames[index]]?.getInput() else { return nil }
            if !signUpInput.input(atIndex: index, value: value) { return nil }
        }
        
        return signUpInput
    }
        
}
