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
    
    static func getQuizData(){
        // Do any additional setup after loading the view.
        

        QuizDataAccess.getAllQuizzes(numberOfRecords: 1000) {
			quizzes in
            
			for quiz in quizzes {
				if(self.categories.contains(quiz.categoryName) == false) {
					self.categories.append(quiz.categoryName)
				}
			}
        }
		print(self.categories)
		print("finished printing")
    }
}
