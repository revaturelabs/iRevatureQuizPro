//
//  QuizWrapper.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

struct QuizWrapper {
    private var quizData: BQuiz
    private var questions: [QuestionObject]
    
    init(quizData: BQuiz) {
        self.quizData = quizData
        self.questions = [QuestionObject]()
    }
    
    init (quizData: BQuiz, questions: [QuestionObject]) {
        self.quizData = quizData
        self.questions = questions
    }
}


//============================
    //Access and Modification functions
//============================
extension QuizWrapper {
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
    
    var getQuizData: BQuiz {
        return quizData
    }
    
    var getAllQuestions: [QuestionObject] {
        return questions
    }
}
