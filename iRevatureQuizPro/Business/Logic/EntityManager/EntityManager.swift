//
//  EntityManager.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class EntityManager {
	private static var quizzes : [BQuiz] = [BQuiz]()
	private static var questions : [QuestionObject] = [QuestionObject]()
	
	init() {
		
	}
	
	static func getQuizList() -> [BQuiz] {
		return quizzes
	}
	
	static func addQuizToList(quiz: BQuiz) {
		quizzes.append(quiz)
	}
	
	static func getQuestionList() -> [QuestionObject] {
		return questions
	}
	
	static func addQuestionToLis(question: QuestionObject) {
		questions.append(question)
	}
	
	static func assembleBQuizObject(allhalf: BQuizAllHalf, byidhalf: BQuizByIDHalf) -> BQuiz {
		let newQuizItem = BQuiz(
			
			// May need more coalscing operators if items come back nil when not expected - unsure of what options in the API weren't necessary or unfilled (like metaTags)
			// All API parts
			id: allhalf.id,
			title: allhalf.title,
			categoryId: allhalf.categoryId,
			passPercentage: allhalf.passPercentage,
			metaTags: allhalf.metaTags ?? "",
			mode: allhalf.mode,
			orgId: allhalf.orgId,
			version: allhalf.version,
			superParentId: allhalf.superParentId,
			preSignupFlag: allhalf.preSignupFlag,
			dashboardFlag: allhalf.dashboardFlag,
			overrideFlag: allhalf.overrideFlag,
			createdBy: allhalf.createdBy,
			createdOn: allhalf.createdOn,
			isActive: allhalf.isActive,
			isStickyEnabled: allhalf.isStickyEnabled,
			isImageUploaded: allhalf.isImageUploaded,
			quizDuration: allhalf.quizDuration,
			isDurationOverridden: allhalf.isDurationOverridden,
			isPublic: allhalf.isPublic,
			updatedTotalRecords: allhalf.updatedTotalRecords,
			displayCorrectAnswerWhenPassed: allhalf.displayCorrectAnswerWhenPassed,
			displayCorrectAnswerWhenFailed: allhalf.displayCorrectAnswerWhenFailed,
			isReviewEnabled: allhalf.isReviewEnabled,
			showWhetherCorrect: allhalf.showWhetherCorrect,
			displayScore: allhalf.displayScore,
			timerEnable: allhalf.timerEnable,
			showExplanation: allhalf.showExplanation,
			shuffleQsn: allhalf.shuffleQsn,
			shuffleAns: allhalf.shuffleAns,
			contentType: allhalf.contentType,
			iconDeleted: allhalf.iconDeleted,
			enableSaveResume: allhalf.enableSaveResume,
			categoryName: allhalf.categoryName,
			createdName: allhalf.createdName,
			qsnCount: allhalf.qsnCount,
			isChildAvailable: allhalf.isChildAvailable,
			totalRecords: allhalf.totalRecords,
			
			// By ID API Parts
			levelId: byidhalf.levelId,
			noOfAttempts: byidhalf.noOfAttempts,
			metaDescription: byidhalf.metaDescription,
			modifiedBy: byidhalf.modifiedBy,
			modifiedOn: byidhalf.modifiedOn,
			quizPools: byidhalf.quizPools,
			activityPoints: byidhalf.activityPoints,
			isReqForPublish: byidhalf.isReqForPublish,
			tags: byidhalf.tags,
			slug: byidhalf.slug,
			description: byidhalf.description,
			instructions: byidhalf.instructions,
			modifiedName: byidhalf.modifiedName)
		
		return newQuizItem
	}
}

struct BQuizAllHalf {
	var id: Int
	var title: String
	var categoryId: Int
	var passPercentage: Int
	var metaTags: String?
	var mode: String
	var orgId: Int
	var version: Int
	var superParentId: Int
	var preSignupFlag: Bool
	var dashboardFlag: Bool
	var overrideFlag: Bool
	var createdBy: Int
	var createdOn: String
	var isActive: Bool
	var isStickyEnabled: Bool
	var isImageUploaded: Bool
	var quizDuration: Int
	var isDurationOverridden: Bool
	var isPublic: Bool
	var updatedTotalRecords: Bool
	var displayCorrectAnswerWhenPassed: Bool
	var displayCorrectAnswerWhenFailed: Bool
	var isReviewEnabled: Bool
	var showWhetherCorrect: Bool
	var displayScore: Bool
	var timerEnable: Bool
	var showExplanation: Bool
	var shuffleQsn: Bool
	var shuffleAns: Bool
	var contentType: String
	var iconDeleted: Bool
	var enableSaveResume: Bool
	var categoryName: String // For filtering with search bar
	var createdName: String
	var qsnCount: Int
	var isChildAvailable: Bool
	var totalRecords: Int
}

struct BQuizByIDHalf {
	var levelId: Int
	var noOfAttempts: Int
	var metaDescription: String
	var modifiedBy: Int
	var modifiedOn: String
	var quizPools: [QuizPoolItem]
	var activityPoints: Int
	var isReqForPublish: Bool
	var tags: String
	var slug: String
	var description: String
	var instructions: String
	var modifiedName: String
}
