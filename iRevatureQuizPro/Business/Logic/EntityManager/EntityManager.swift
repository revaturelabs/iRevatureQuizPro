//
//  EntityManager.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class EntityManager {
	var quizzes : [BQuiz]
	var questions : [QuestionObject]
	
	init() {
		quizzes = [BQuiz]()
		questions = [QuestionObject]()
	}
}
