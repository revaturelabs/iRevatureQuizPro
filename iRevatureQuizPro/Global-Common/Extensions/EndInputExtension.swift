//
//  EndInputExtension.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/7/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

extension UIView {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
