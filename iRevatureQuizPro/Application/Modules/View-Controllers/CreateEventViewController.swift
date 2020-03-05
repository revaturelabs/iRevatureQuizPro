//
//  CreateEventViewController.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/4/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class CreateEventViewController: BaseViewController {
    
    @IBOutlet weak var eventInputTable: UITableView!
    
    let tableCellIdentifier: String = "CreateEventCell"
    let inputNames: [String] = ["Event Code", "Event Name", "Location", "Date", "Quiz", "Ambassador", "Useless", "Useless", "Useless"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventInputTable.dataSource = self
        eventInputTable.delegate = self
    }
    
    
}

extension CreateEventViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! CreateEventTableCell
        
        cell.setFieldName(name: inputNames[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    
}
