//
//  QuizWrapper.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

struct QuizInfo {
    var title: String
    var levelId: Int
    var categoryId: Int
    var noOfAttempts: Int
    var passPercentage: Int
    var mode: String
    var preSignupFlag = false
    var dashboardFlag = false
    var overrideFlag = false
    var isActive = true
    var isStickyEnabled = false
    var isImageUploaded = false
    var quizDuration: Int
    var isDurationOverridden = false
    var isPublic = false
    var description: String
    var enableSaveResume = false
    var displayCorrectAnswerWhenPassed = false
    var displayCorrectAnswerWhenFailed = false
    var isReviewEnabled = false
    var showWhetherCorrect = false
    var displayScore = false
    var timerEnable = true
    var showExplanation = false
    var shuffleQsn = false
    var shuffleAns = false
    var iconDeleted = false
    var updatedTotalRecords = false
}

struct QuizWrapper {
    var quizData: QuizInfo
    private var questions: [QuestionObject]
    
    init(quizData: QuizInfo) {
        self.quizData = quizData
        self.questions = [QuestionObject]()
    }
    
    init (quizData: QuizInfo, questions: [QuestionObject]) {
        self.quizData = quizData
        self.questions = questions
    }
}


//============================
    //Access and Modification functions
//============================
extension QuizWrapper {
    mutating func add(question: QuestionObject) {
        for q in self.questions {
            if q.id == question.id { return }
        }
        
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
    
    var getQuizData: QuizInfo {
        return quizData
    }
    
    var getAllQuestions: [QuestionObject] {
        return questions
    }
    
    func getQuestionBy(id: Int) -> QuestionObject? {
        for q in self.questions {
            if q.id == id { return q }
        }
        
        return nil
    }
    
    func getQuestionsBy(tag: String) -> [QuestionObject] {
        var questionHolder = [QuestionObject]()
        
        for q in self.questions {
            if q.tags == tag { questionHolder.append(q) }
        }
        
        return questionHolder
    }
    
    func getQuestionsBy(type: String) -> [QuestionObject] {
        var questionHolder = [QuestionObject]()
        
        for q in self.questions {
            if q.questionType == type { questionHolder.append(q) }
        }
        
        return questionHolder
    }
}
