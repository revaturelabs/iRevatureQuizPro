//
//  EventViewViewController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class EventViewViewController: BaseViewController {

    @IBOutlet weak var eventSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addGradientToView(view: self.view)
    }

    @IBAction func addEventButton(_ sender: Any) {
    }
    
    @IBAction func optionsButton(_ sender: Any) {
    }
}
