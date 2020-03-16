//
//  CreateQuestionPool.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation


//struct for quizPoolQuestions key to create new quiz
struct CQQuizPoolQuestion: Encodable {
    var question: CQQuestionItem
    var dontEvaluate: Bool
}
