//
//  RevatureTextField.swift
//  iRevatureQuizPro
//
//  Created by Nathan Coggins on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class RevatureTextField: UITextField{

    override init(frame: CGRect){
        super.init(frame: frame)
        setupTextField()
    }
    
    //Calls all functions needed to apply styles
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextField()
        
    }
    
    func setupTextField(){
        
        placeholder = "Heyy"
        font = UIFont(name: "Helvetica", size: 17)
        borderStyle = UITextField.BorderStyle.roundedRect
        frame.size = CGSize(width: 250, height: 50)
        layer.cornerRadius = 15
        
    }
    
    
    override var isEnabled: Bool {
        didSet{
            if !self.isEnabled {
                self.alpha = 0.5
                
            }
            else {
                self.alpha = 1
                
            }
            
        }
    }
    
}
