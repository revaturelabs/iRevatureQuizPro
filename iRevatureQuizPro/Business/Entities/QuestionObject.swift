//
//  QuestionObject.swift
//  iRevatureQuizPro
//
//  Created by Nathan Coggins on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct QuestionObject{
    var id: Int
    var title: String
    var tags: String
    var qsnAnswers: [QuestionAnswer]
    var questionType: String
    var qsnType: QuestionType
    var validAnswers: Bool
}
