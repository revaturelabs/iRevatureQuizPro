//
//  QuizPoolItem.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct QuizPoolItem : Codable {
    var id: Int?
    var name: String
    var maxQstnToDisplay: Int
    var displayOrder: Int
    var quizPoolQuestions: [QuizQuestionPool]
    var isEdittedMaxQsnToDisp: Bool
}
