//
//  QuizAPIData.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/9/20.
//	Modified by Jeremy Malisse 3/11/2020.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

// API response struct for the data contained in Quiz Responses
struct QuizAPIData : Codable {
        var id: Int
        var title: String
        var levelId: Int?
        var categoryId: Int
        var noOfAttempts: Int?
        var passPercentage: Int
        var metaTags: String?
        var metaDescription: String?
        var version: Int
        var mode: String
        var orgId: Int
        var superParentId: Int
        var preSignupFlag: Bool
        var dashboardFlag: Bool
        var overrideFlag: Bool
        var createdBy: Int
        var createdOn: String?
        var modifiedBy: Int?
        var modifiedOn: String?
        var quizPools: [QuizPoolItem]?
        var activityPoints: Int?
        var isActive: Bool
        var isStickyEnabled: Bool
        var isImageUploaded: Bool
        var isReqForPublish: Bool?
        var quizDuration: Int
        var isDurationOverridden: Bool
        var isPublic: Bool
        var tags: String?
        var slug: String?
        var description: String?
        var instructions: String?
        var enableSaveResume: Bool
        var displayCorrectAnswerWhenPassed: Bool
        var displayCorrectAnswerWhenFailed: Bool
        var isReviewEnabled: Bool
        var showWhetherCorrect: Bool
        var displayScore: Bool
        var timerEnable: Bool
        var showExplanation: Bool
        var shuffleQsn: Bool
        var shuffleAns: Bool
        var qsnCount: Int?
        var isChildAvailable: Bool?
        var contentType: String
        var totalRecords: Int?
        var iconDeleted: Bool
        var updatedTotalRecords: Bool
        var categoryName: String
        var createdName: String
        var modifiedName: String?
}


//// API response struct for the AllQuizzes API call
//struct APIQuizResults: Codable {
//    var statusCode: Int
//    var description: String
//    var data: [QuizAPIData]
//}

// API response struct for the data contained in AllQuizzes API call
//struct QuizAPIAllData: Codable {
//	
//	var id: Int
//	var title: String
//	var categoryId: Int
//	var passPercentage: Int
//	var metaTags: String?
//	var version: Int
//	var mode: String
//	var orgId: Int
//    var superParentId: Int
//	var preSignupFlag: Bool
//	var dashboardFlag: Bool
//	var overrideFlag: Bool
//	var createdBy: Int
//	var isActive: Bool
//	var isStickyEnabled: Bool
//	var isImageUploaded: Bool
//	var quizDuration: Int
//	var isDurationOverridden: Bool
//	var isPublic: Bool
//	var enableSaveResume: Bool
//	var displayCorrectAnswerWhenPassed: Bool
//	var displayCorrectAnswerWhenFailed: Bool
//	var isReviewEnabled: Bool
//	var showWhetherCorrect: Bool
//	var displayScore: Bool
//	var timerEnable: Bool
//	var showExplanation: Bool
//	var shuffleQsn: Bool
//	var shuffleAns: Bool
//	var qsnCount: Int
//	var isChildAvailable: Bool
//	var contentType: String
//	var totalRecords: Int
//	var iconDeleted: Bool
//	var updatedTotalRecords: Bool
//    var categoryName: String
//    var createdName: String
//}

//struct QuizAPIByIDData : Codable {
//		var id: Int
//		var title: String
//		var levelId: Int
//		var categoryId: Int
//		var noOfAttempts: Int
//		var passPercentage: Int
//		var metaTags: String?
//		var metaDescription: String
//		var version: Int
//		var mode: String
//		var orgId: Int
//		var superParentId: Int
//		var preSignupFlag: Bool
//		var dashboardFlag: Bool
//		var overrideFlag: Bool
//		var createdBy: Int
//		var createdOn: String
//		var modifiedBy: Int
//		var modifiedOn: String
//		var quizPools: [QuizPoolItem]
//		var activityPoints: Int
//		var isActive: Bool
//		var isStickyEnabled: Bool
//		var isImageUploaded: Bool
//		var isReqForPublish: Bool
//		var quizDuration: Int
//		var isDurationOverridden: Bool
//		var isPublic: Bool
//		var tags: String
//		var slug: String
//		var description: String
//		var instructions: String
//		var enableSaveResume: Bool
//		var displayCorrectAnswerWhenPassed: Bool
//		var displayCorrectAnswerWhenFailed: Bool
//		var isReviewEnabled: Bool
//		var showWhetherCorrect: Bool
//		var displayScore: Bool
//		var timerEnable: Bool
//		var showExplanation: Bool
//		var shuffleQsn: Bool
//		var shuffleAns: Bool
//		var contentType: String
//		var iconDeleted: Bool
//		var updatedTotalRecords: Bool
//		var categoryName: String
//		var createdName: String
//		var modifiedName: String
//}


//Common / QuizPoolItem.swift

//	struct QuizPoolItem : Codable {
//		var id: Int
//		var name: String
//		var maxQstnToDisplay: Int
//		var displayOrder: Int
//		var quizPoolQuestions: QuizQuestionPool //[QuizQuestionPool]
//		var isEdittedMaxQsnToDisp: Bool
//	}

//Common / QuizQuestionPool

//	struct QuizQuestionPool : Codable  {
//		var id: Int
//		var question: QuestionPoolItem
//		var order: Int
//		var isSticky: Bool
//		var dontEvaluate: Bool
//	}

// Common / QuestionPoolItem.swift
//	struct QuestionPoolItem : Codable  {
//		var id: Int
//		var title: String
//		var levelId: Int
//		var points: Int
//		var score: Double
//		var tags: String
//		var durationInSec: Int
//		var categoryId: Int
//		var qsnAnswers: [QuestionAnswer]//[AnswerItem]
//		var qsnType: QuestionType
//		var categoryName: String
//		var isDeactivated: Bool
//		var updatedTotalRecords: Bool
//		var lineNumber: Int
//		var validAnswers: Bool
//	}
    
//Dupicate struct with Common / QuestionAnswer.swift
	
//	struct AnswerItem : Codable  {
//		var id: Int
//		var answer: String
//		var order: Int
//		var correct: Bool
//		var sticky: Bool
//	}
	
//Duplicate struct with Common / QuestionType.swift
    
//	struct QuestionType : Codable  {
//		var id: Int
//		var code: String
//		var qsnType: String
//	}







