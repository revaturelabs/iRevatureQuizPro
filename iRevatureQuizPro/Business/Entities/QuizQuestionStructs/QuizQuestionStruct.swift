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
        var count: Int = 0
        for answer in answers {
            if (answer.isCorrect && answer.isSelected){
                count += 1
            }
        }
        return count
    }
    
    var numCorrect: Int {
        var count = 0
        for answer in answers {
            if answer.isCorrect == true {
                count += 1
            }
        }
        return count
    }
    
    var totalQuestionsAnswered: Float {
        return Float(correctAnswer) / Float(numCorrect)
    }
}

//Struct that contains the answer key for taking the quiz
public struct TakeQuizAnswer {
    var answer: String
    var isCorrect: Bool
    var isSelected: Bool
}
