//
//  AttendeeSignupTableCell.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
import Foundation

class AttendeeSignupTableCell: UITableViewCell {

    static let cellIdentifier: String = "attendeeSignupTableCell"
    static let cellHeight: CGFloat = 44
    
    @IBOutlet private var textInput: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setTextInput(name: String) {
        textInput.placeholder = name
    }
    
    func getInput() -> String? {
        return textInput.text
    }
    
    func setKeyboard(keyboardType: UIKeyboardType) {
        textInput.keyboardType = keyboardType
        textInput.enablesReturnKeyAutomatically = true
    }

}
