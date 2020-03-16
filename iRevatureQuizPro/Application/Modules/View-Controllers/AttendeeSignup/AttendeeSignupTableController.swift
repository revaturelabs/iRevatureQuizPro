//
//  AttendeeSignupTableController.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class AttendeeSignupTableController: UITableViewController {
    
    //Hold reference to all the cells in the table to get data from later
    private var cells: [String : AttendeeSignupTableCell] = [String : AttendeeSignupTableCell]()

    //Set how many cells are going to be in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AttendeeSignupFields.allFields.count
    }
    
    //Setup cells in table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AttendeeSignupTableCell.cellIdentifier, for: indexPath) as! AttendeeSignupTableCell
        
        cell.setTextInput(name: "\(AttendeeSignupFields.allFields[indexPath.row].text)*")
        cell.setKeyboard(keyboardType: AttendeeSignupFields.allFields[indexPath.row].keyboardType)
        
        if AttendeeSignupFields.allFields[indexPath.row].pickerValues.count > 0 {
            cell.setTextInputAsPicker(pickerValues: AttendeeSignupFields.allFields[indexPath.row].pickerValues)
        }
        
        cells[AttendeeSignupFields.allFields[indexPath.row].text] = cell
        
        return cell
    }
    
    //Set height for each cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AttendeeSignupTableCell.cellHeight
    }
    
    //Get data from cells
    func getInputData() -> BEventAttendeeSignUpInputData? {
        var signUpInput = BEventAttendeeSignUpInputData()
        
        for index in 0...AttendeeSignupFields.allFields.count - 1 {
            guard let value = cells[AttendeeSignupFields.allFields[index].text]?.getInput() else { return nil }
            if !signUpInput.input(atIndex: index, value: value) { return nil }
        }
        
        return signUpInput
    }
        
}
