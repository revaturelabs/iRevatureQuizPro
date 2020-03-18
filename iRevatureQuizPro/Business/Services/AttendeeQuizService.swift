//
//  AttendeeQuiz.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/18/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class AttendeeQuizService {

    private static var currentQuiz = Quiz(title: "No Quiz", questions: [], duration: 0)

    static func fetchCurrentQuiz(quizId: Int) {
        
        QuizAPI.getQuizById(quizId: quizId) { (result) in
            //set questions array
            var questions = [Question]()
            //go through question pools to get data
            for quizPool in result.data.quizPools! {
                //go through questions in questionpool
                for question in quizPool.quizPoolQuestions {
                    //set answers array
                    var answers = [Answer]()
                    //go through answers in the question
                    for answer in question.question.qsnAnswers {
                        //add answers to answer array
                        answers.append(Answer(answer: answer.answer, isCorrect: answer.correct, isSelected: false))
                    }
                    //add questions to question array
                    questions.append(Question(question: question.question.title, answers: answers, isAnswered: false))
                }
            }
            
            self.currentQuiz = Quiz(title: result.data.title, questions: questions, duration: result.data.quizDuration)
        }
        
    }
    
    static func getCurrentQuiz() -> Quiz {
        return self.currentQuiz
    }

}
