//
//  EventViewViewController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class EventViewViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBOutlet weak var eventSearchBar: UISearchBar!
    @IBOutlet weak var eventsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventsTable.dataSource = self
        self.eventsTable.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func addEventButton(_ sender: Any) {
        let nextVC = CreateEventViewController.instantiate(fromAppStoryboard: AppStoryboard.EventManagement)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: false, completion: nil)
    }
    
    @IBAction func optionsButton(_ sender: Any) {
        let nextVC = EmployeeLoginViewController.instantiate(fromAppStoryboard: AppStoryboard.EmployeeLogin)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: false, completion: nil)
    }
}
