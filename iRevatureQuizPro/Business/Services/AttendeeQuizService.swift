//
//  AttendeeQuiz.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/18/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class AttendeeQuizService {

    private static var currentQuiz = TakeQuizQuiz(title: "No Quiz", questions: [
        TakeQuizQuestion(question: "Is CoreData a RDBMS?", answers: [TakeQuizAnswer(answer: "True", isCorrect: false, isSelected: false), TakeQuizAnswer(answer: "False", isCorrect: true, isSelected: false)], isAnswered: false),
        TakeQuizQuestion(question: "What does MVC stands for?", answers: [TakeQuizAnswer(answer: "Main View Controller", isCorrect: true, isSelected: false), TakeQuizAnswer(answer: "Model View Controller", isCorrect: true, isSelected: false), TakeQuizAnswer(answer: "Main Viewer Control", isCorrect: false, isSelected: false)], isAnswered: false),
        TakeQuizQuestion(question: "Is Swift a Type Safe language?", answers: [TakeQuizAnswer(answer: "True", isCorrect: true, isSelected: false), TakeQuizAnswer(answer: "False", isCorrect: false, isSelected: false)], isAnswered: false),
        TakeQuizQuestion(question: "What is the purpose of Info.plist?", answers: [TakeQuizAnswer(answer: "Contains API data.", isCorrect: false, isSelected: false), TakeQuizAnswer(answer: "Contains SQL persistence data.", isCorrect: false, isSelected: false), TakeQuizAnswer(answer: "Contains the configuration of the project.", isCorrect: true, isSelected: false)], isAnswered: false),
        TakeQuizQuestion(question: "Is CoreData thread safe?", answers: [TakeQuizAnswer(answer: "True", isCorrect: false, isSelected: false), TakeQuizAnswer(answer: "False", isCorrect: true, isSelected: false)], isAnswered: false)
    ], duration: 0)

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
        }
        
    }
    
    static func getCurrentQuiz() -> TakeQuizQuiz {
        return self.currentQuiz
    }

}
