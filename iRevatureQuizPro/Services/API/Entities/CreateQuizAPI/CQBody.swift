//  CreateQuestionBody.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation


//struct for JSON to create new quiz
struct CQBody: Encodable {
    var title: String
    var levelId: Int
    var categoryId: Int
    var noOfAttempts: Int
    var passPercentage: Int
    var mode: String
    var preSignupFlag = false
    var dashboardFlag = false
    var overrideFlag = false
    var quizPools: [CQQuizPool]
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

extension QuizWrapper {
    /// - Warning: There are missing fields that need to be addressed
    var toAPIFormat: CQBody {
        let quizData = self.getQuizData
        let allQuestions = self.getAllQuestions
        
        var questionItemArray = [CQQuestionItem]()
        var questionPoolQuestions = [CQQuizPoolQuestion]()
        var quizPoolArray = [CQQuizPool]()
        
        questionItemArray = allQuestions.map({CQQuestionItem(id: $0.id, title: $0.title, tags: $0.tags, qsnAnswers: $0.qsnAnswers, qsnType: $0.qsnType, validAnswers: $0.validAnswers)})
        
        // TODO: Need to set a proper dontEvaluate
        questionPoolQuestions = questionItemArray.map({CQQuizPoolQuestion(question: $0, dontEvaluate: false)})
        
        // TODO: Need someway to set name, displayOrder, isEdittedMaxQsnToDisp
        quizPoolArray = questionPoolQuestions.map({CQQuizPool(name: quizData.createdName, maxQstnToDisplay: [$0].count, displayOrder: 1, quizPoolQuestions: [$0], isEdittedMaxQsnToDisp: false)})
        
        return CQBody(title: quizData.createdName, levelId: quizData.levelId, categoryId: quizData.categoryId, noOfAttempts: quizData.noOfAttempts, passPercentage: quizData.passPercentage, mode: quizData.mode, preSignupFlag: quizData.preSignupFlag, dashboardFlag: quizData.dashboardFlag, overrideFlag: quizData.overrideFlag, quizPools: quizPoolArray, isActive: quizData.isActive, isStickyEnabled: quizData.isStickyEnabled, isImageUploaded: quizData.isImageUploaded, quizDuration: quizData.quizDuration, isDurationOverridden: quizData.isDurationOverridden, isPublic: quizData.isPublic, description: quizData.description, enableSaveResume: quizData.enableSaveResume, displayCorrectAnswerWhenPassed: quizData.displayCorrectAnswerWhenPassed, displayCorrectAnswerWhenFailed: quizData.displayCorrectAnswerWhenFailed, isReviewEnabled: quizData.isReviewEnabled, showWhetherCorrect: quizData.showWhetherCorrect, displayScore: quizData.displayScore, timerEnable: quizData.timerEnable, showExplanation: quizData.showExplanation, shuffleQsn: quizData.shuffleQsn, shuffleAns: quizData.shuffleAns, iconDeleted: quizData.iconDeleted, updatedTotalRecords: quizData.updatedTotalRecords)
        
    }
}
