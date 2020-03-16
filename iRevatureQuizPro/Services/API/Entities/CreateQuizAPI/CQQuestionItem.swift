//
//  CreateQuizQuestionPoolItem.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation


//struct for question key to create new quiz
struct CQQuestionItem: Encodable {
    var id: Int
    var title: String
    var tags: String
    var qsnAnswers: [QuestionAnswer]
    var qsnType: QuestionType
    var validAnswers: Bool
}
