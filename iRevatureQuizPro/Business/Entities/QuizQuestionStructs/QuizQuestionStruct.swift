//
//  QuizQuestionStruct.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//Struct for the data from taking the quiz
public struct Quiz {
    var title: String
    var questions: [Question]
    var duration: Int
}

//Struct that contains the question info for taking the quiz
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

//Struct that contains the answer key for taking the quiz
public struct Answer {
    var answer: String
    var isCorrect: Bool
    var isSelected: Bool
}
