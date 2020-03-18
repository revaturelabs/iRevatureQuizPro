//
//  AttendeeQuiz.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/18/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class AttendeeQuizService {

    static var currentQuiz = TakeQuizQuiz(title: "No Quiz", questions: [], duration: 0)

    //Storage of questions and index of each table to keep selection in memory
    static var quizQuestions = [(question: TakeQuizQuestion, chosenAnswer: IndexPath)]()
    
    static func fetchCurrentQuiz(quizId: Int) {
        
        QuizAPI.getQuizById(quizId: quizId) { (result) in
            //set questions array
            var questions = [TakeQuizQuestion]()
            //go through question pools to get data
            for quizPool in result.data.quizPools! {
                //go through questions in questionpool
                for question in quizPool.quizPoolQuestions {
                    //set answers array
                    var answers = [TakeQuizAnswer]()
                    //go through answers in the question
                    for answer in question.question.qsnAnswers {
                        //add answers to answer array
                        answers.append(TakeQuizAnswer(answer: answer.answer, isCorrect: answer.correct, isSelected: false))
                    }
                    //add questions to question array
                    questions.append(TakeQuizQuestion(question: question.question.title, answers: answers, isAnswered: false))
                }
            }
            
            self.currentQuiz = TakeQuizQuiz(title: result.data.title, questions: questions, duration: result.data.quizDuration)
            
            //Question holder used to populate pages and tables
            self.quizQuestions = questions.map({(question: $0, chosenAnswer: IndexPath(row: -1, section: 0))})
        }
        
    }

}
