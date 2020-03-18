//
//  QuizItemTableViewCell.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/18/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class QuizItemTableViewCell: UITableViewCell {
	
	var quizname: String = ""
	var category: String = ""
	var tags: String = ""
	
	@IBOutlet weak var labelQuizName: UILabel!

	@IBOutlet weak var labelCategoryName: UILabel!
	@IBOutlet weak var labelQuizTags: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		updateDisplay()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func info(title: String, categoryName: String, metaTags: String?) {
		self.quizname = title
		self.category = categoryName
		self.tags = metaTags ?? "None Provided"
	}
	
	func updateDisplay() {
		labelQuizName.text = quizname
		labelCategoryName.text = category
		labelQuizTags.text = tags
	}

}
