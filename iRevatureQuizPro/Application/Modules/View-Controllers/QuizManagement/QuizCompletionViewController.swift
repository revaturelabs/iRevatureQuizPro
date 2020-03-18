//
//  QuizCompletionViewController.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class QuizCompletionViewController: BaseViewController {
	
	
	// Use of the button at the top left navigation bar seems redundant.
	// We already use the GoHome button to unwind the segues (or we should be doing something similar) so why have this button to begin with?
	
	var score: Float = 0.0
	var minimumscore: Float = 0.0
	var quiztitle: String = "Empty name"
	
	@IBOutlet weak var labelCompletionFail: UILabel!
	@IBOutlet weak var labelCompletionPass: UILabel!
	@IBOutlet weak var labelQuizTitle: UILabel!
	@IBOutlet weak var labelPercentScore: UILabel!
	
	// May need to use viewDidAppear instead of load to ensure these are set after results is called
	override func viewDidLoad() {
		super.viewDidLoad()
		updateDisplays()
	}
	
	@IBAction func returnHome(_ sender: UIButton!) {
		// Send to home storyboard/page
		// Need to free resources after the call
		dismiss(animated: true, completion: nil)
	}
	
	func results(score: Float, minimumscore: Float, title: String) {
		self.score = score
		self.minimumscore = minimumscore
		self.quiztitle = title

	}
	
	func updateDisplays() {
		// Use a ternary operator to avoid DRY fault
		if score < minimumscore {
			labelCompletionPass.isHidden = true
			labelCompletionFail.isHidden = false
		}
		else {
			labelCompletionPass.isHidden = false
			labelCompletionFail.isHidden = true
		}
		
		labelPercentScore.text = "\(score) %"
		labelQuizTitle.text = title
	}
}
