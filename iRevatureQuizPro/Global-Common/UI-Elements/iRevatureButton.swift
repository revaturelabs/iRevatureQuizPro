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
    }
    
    //Calls all functions needed to apply styles
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
        
    }
    
    func setupButton(){
        applyContentSytles()
        applyLayoutStyles()
    }
    
    func applyContentSytles(){
        setTitleColor(.revatureOrange, for: .normal)
        titleLabel?.font = UIFont(name: "Helvetica", size: 17)
        
    }
    
    func applyLayoutStyles(){
        layer.cornerRadius = 25.0
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.revatureOrange.cgColor
    }
    
}
