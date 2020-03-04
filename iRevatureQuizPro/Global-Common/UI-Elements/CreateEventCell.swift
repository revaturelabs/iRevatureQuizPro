//
//  CreateEventCell.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/4/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class CreateEventTableCell: RevatureTableViewCell {
    
    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var textInput: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .none
    }
    
    func setFieldName(name: String) {
        self.fieldName.text = "\(name):"
        self.textInput.placeholder = name
    }
    
    func getTextInput() -> String? {
        guard let inputText = self.textInput.text else { return nil }
        return inputText != "" ? inputText : nil
    }
    
}
