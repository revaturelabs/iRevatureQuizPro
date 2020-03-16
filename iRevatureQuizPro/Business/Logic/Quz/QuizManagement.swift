//
//  CreatingQuiz.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

class BQuizManagement {
    func getQuestions() {
        
    }
    
    func createQuiz(with data: BQuiz) -> QuizWrapper {
        return QuizWrapper(quizData: data, questions: [])
    }
    
    func add(question: QuestionObject, to quiz: inout QuizWrapper) {
        quiz.add(question: question)
    }
}
