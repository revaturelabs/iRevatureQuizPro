//
//  QuizCategoryParse.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import UIKit

class QuizCategoryParse {
	
	let dataManagerDelegate = UIApplication.shared.delegate as! AppDelegate
	
	var manager : EntityManager?
	init() {
		manager = dataManagerDelegate.manager!
	}
	
	func parseCategories() -> [String] {
		// can reference manager instance to get current list of all quizzes once the getter is available
		// using that, can parse all of the categories out from whatever came from the API
		
		
		// currently returning empty string - will need to return based on the parsed catgories at this point - need a container for them
		return [String]()
		
	}
}
