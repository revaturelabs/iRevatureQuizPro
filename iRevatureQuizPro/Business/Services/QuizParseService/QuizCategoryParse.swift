//
//  QuizCategoryParse.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class QuizCategoryParse {
	
	func loadData() {
		QuizAPI.getAllQuizzes(numberOfRecords: 800, finish: {
			results in
			
			print("should be results next")
			print(results)
			
//			for object in results {
//			}
			
		})
		
		/* Ned to come back to this when the service is finished - cannot check quiz by ID until then
		QuizDataAccess.getQuizById(quizId: <#T##String#>, finish: {
			results in
			
		})
		*/
	}
}
