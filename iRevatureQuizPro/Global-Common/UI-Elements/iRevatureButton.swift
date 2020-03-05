//
//  iRevatureButton.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/4/20.
//  Modified by Jeremy Malisse on 3/5/2020.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

@IBDesignable
class RevatureButton: UIButton {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setTitleColor(UIColor.revatureOrange, for: .normal)
        titleLabel?.font = UIFont(name: "Helvetica", size: 17)
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var buttonWidth: CGFloat = 0 {
        didSet {
            widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        }
    }
    
    @IBInspectable var buttonHeight: CGFloat = 0 {
        didSet {
            heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        }
    }
    
    @IBInspectable var titleColor: UIColor = UIColor.clear {
        didSet {
            self.setTitleColor(titleColor, for: .normal)
        }
    }
    
    @IBInspectable var buttonBackgroundColor: UIColor = UIColor.clear {
        didSet {
            backgroundColor = buttonBackgroundColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //Calls all functions needed to apply styles
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var isEnabled: Bool {
        didSet {
            if !self.isEnabled {
                self.alpha = 0.5
            } else {
                self.alpha = 1
            }
        }
    }
}



 
// MARK: Notes for Constraints and Auto Layout
 
/*
 
 ======== iPhone 11 Pro Max 13.3 ========
 
 Height minimum:    50pts
 Width minimum:     Dependant on Text
 
 
*/
 
 

