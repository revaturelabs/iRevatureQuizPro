//
//  QuizWrapper.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

struct QuizWrapper {
    var quizData: BQuiz
    var questions: [QuestionObject]
    
    mutating func add(question: QuestionObject) {
        self.questions.append(question)
    }
    
    mutating func remove(question: QuestionObject) {
        for (index, q) in self.questions.enumerated() {
            if q.id == question.id {
                self.questions.remove(at: index)
                return
            }
        }
    }
}
