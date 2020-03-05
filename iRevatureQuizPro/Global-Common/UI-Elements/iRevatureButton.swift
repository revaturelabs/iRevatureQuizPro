//
//  iRevatureButton.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/4/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class RevatureButton: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
        setupButton()
    }
    
    //Calls all functions needed to apply styles
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
        
    }
    
    func setupButton(){
        setTitleColor(.revatureOrange, for: .normal)
        backgroundColor = UIColor.white
        titleLabel?.font = UIFont(name: "Helvetica", size: 17)
        layer.cornerRadius = 25.0
        layer.borderWidth = 3
        layer.borderColor = UIColor.revatureOrange.cgColor
        widthAnchor.constraint(equalToConstant: 250).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true

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
