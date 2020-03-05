//
//  DropdownPicker.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class DropdownPicker: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerData:[String]!
    var pickerTextField: UITextField!
    
    init(pickerData: [String], textField: UITextField) {
        super.init(frame: CGRect.zero)
        
        //set picker data & associated text field
        self.pickerData = pickerData
        self.pickerTextField = textField
        
        //set up picker view look
        self.pickerTextField.inputAccessoryView = OrangeToolbar(textField: pickerTextField)
        self.backgroundColor = UIColor.white
        
        //set data source and delegate to self
        self.delegate = self
        self.dataSource = self
        
        //disable when there is no data
        DispatchQueue.main.async(execute: {
            if pickerData.count > 0 {
                self.pickerTextField.text = self.pickerData[0]
                self.pickerTextField.isEnabled = true
            } else {
                self.pickerTextField.text = nil
                self.pickerTextField.isEnabled = false
            }
        })
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //number of columns in picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    //number of items in picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    //get information for each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    
    //set textfield to user selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickerData[row]
    }
}
