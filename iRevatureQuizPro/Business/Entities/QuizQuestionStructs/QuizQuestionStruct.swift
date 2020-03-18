//
//  QuizQuestionStruct.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//Struct for the data from taking the quiz
public struct TakeQuizQuiz {
    var title: String
    var questions: [TakeQuizQuestion]
    var duration: Int
}

//Struct that contains the question info for taking the quiz
public struct TakeQuizQuestion{
    var question: String
    var answers: [TakeQuizAnswer]
    var isAnswered: Bool
    var correctAnswer: Int {
        get {
            var count: Int = 0
            for index in answers {
                if (index.isCorrect == index.isSelected && index.isCorrect == true){
                    count += 1
                }
            }
            return count
        }
    }
    var numCorrect: Int {
        get {
            var count = 0
            for index in answers {
                if index.isCorrect == true {
                    count += 1
                }
            }
            return count
        }
    }
    var totalQuestionsAnswered: Float {
        get {
            return Float( correctAnswer / numCorrect )
        }
    }
}

//Struct that contains the answer key for taking the quiz
public struct TakeQuizAnswer {
    var answer: String
    var isCorrect: Bool
    var isSelected: Bool
}
