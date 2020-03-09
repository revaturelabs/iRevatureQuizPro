//
//  UITextFieldExtension.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func pickerSelector(data: [String]){
        self.inputView = DropdownPicker(pickerData: data, textField: self)
    }
    
    func dateSelector() {
        self.inputView = DatePicker(dateFormat: "MMM dd, yyyy", textField: self)
    }
    
}
