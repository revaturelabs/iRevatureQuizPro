//
//  DateDropdownPicker.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class DatePicker: UIDatePicker {
    
    var pickerTextField: UITextField!
    
    let format = DateFormatter()
    
    init(dateFormat: String, textField: UITextField) {
        super.init(frame: CGRect.zero)
        
        //set picker mode to date
        self.datePickerMode = .date
        self.timeZone = NSTimeZone.local
        
        //set up date format and populate text field
        self.format.dateFormat = dateFormat
        self.pickerTextField = textField
        self.pickerTextField.text = format.string(from:self.date)
        
        //add toolbar to top of picker view
        self.pickerTextField.inputAccessoryView = OrangeToolbar(textField: pickerTextField)
        
        //change background color of picker view
        self.backgroundColor = UIColor.white
        
        //handle picker change
        self.addTarget(self, action: #selector(updateDate), for: .valueChanged)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func updateDate() {
        self.pickerTextField.text = format.string(from:self.date)
    }

}
