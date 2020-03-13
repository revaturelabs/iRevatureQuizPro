//
//  QuizDataService.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/11/20.
// 	Modified by Jeremy Malisse on 3/12/2020.
//  Copyright © 2020 revature. All rights reserved.
//

class QuizDataService {
	
	static private var quizlist : [QuizAPIAllData]?
	static private var categories = [String]()
    
	static func getQuizData(finish: @escaping ([String]) -> Void) {
        // Do any additional setup after loading the view.
        
		print("pulling quiz data")

        QuizDataAccess.getAllQuizzes(numberOfRecords: 1000) {
			quizzes in
            
			for quiz in quizzes {
				if(self.categories.contains(quiz.categoryName) == false) {
					self.categories.append(quiz.categoryName)
				}
			}
        }
		finish(self.categories)
    }
	
	
	static func getQuizDataForID(id: Int, finish: @escaping (QuizAPIByIDData) -> Void) {
		
		print("updating all current quiz IDs into memory")
		
		
		
		//QuizDataAccess.getQuizById(quizId: <#T##String#>, finish: <#T##(QuizAPIByIDData) -> Void#>)
	}
}
