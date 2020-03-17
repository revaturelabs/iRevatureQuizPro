//
//  MultipleChoiceQuestionTableCell.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class MCQuestionTableCell: UITableViewCell {

    @IBOutlet weak var answerText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
