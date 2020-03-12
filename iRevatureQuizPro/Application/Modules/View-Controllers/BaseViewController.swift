//
//  BaseController.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    let revOrange = UIColor.init(red:1, green: 96/255, blue: 0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //addGradientToView(view: self.view)
    }
    
    func addGradientToView(view: UIView)
    {
        //gradient layer
        let gradientLayer = CAGradientLayer()
        //define colors
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.systemGray3.cgColor, revOrange.cgColor]
        //define locations of colors as NSNumbers in range from 0.0 to 1.0
        //if locations not provided the colors will spread evenly
        gradientLayer.locations = [0.3, 0.55, 1.0]
        //define frame
        gradientLayer.frame = view.bounds
        //insert the gradient layer to the view layer
        view.layer.insertSublayer(gradientLayer, at: 0)
        //creates a raster of the static image, improves app performance
        gradientLayer.shouldRasterize = true

    }
}
