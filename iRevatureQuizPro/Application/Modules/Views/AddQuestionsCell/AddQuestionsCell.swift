//
//  AddQuestions.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import UIKit

class AddQuestionCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var tagsLabel: UILabel!
    
    @IBOutlet weak var addQuestionSwitch: UISwitch!
    
    @IBOutlet weak var addLabel: UILabel!
    
    var callback : ((Bool)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
        callback?(sender.isOn)
    }
}
