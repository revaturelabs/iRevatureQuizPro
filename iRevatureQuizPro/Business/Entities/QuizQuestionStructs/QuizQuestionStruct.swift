//
//  QuizQuestionStruct.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

public struct Quiz {
    var title: String
    var questions: [Question]
    var duration: Int
}

public struct Question{
    var question: String
    var answers: [Answer]
    var isAnswered: Bool
    var numCorrect: Int
    var correctAnswer: Int
    var totalQuestionsAnswered: Float {
        get {
            return Float( correctAnswer / numCorrect )
        }
    }
}
public struct Answer {
    var answer: String
    var isCorrect: Bool
    var isSelected: Bool
}
