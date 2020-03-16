//
//  CreateQuizAPI.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import Alamofire
import os.log

class CreateQuizAPI {
    
    static let endpoint = "https://preview-ms.revature.com/apigateway/quiz/secure"
    
    static func createNewQuiz(quiz: CQBody, completionHandler: @escaping (_ didCreate: Bool) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "encryptedToken": "7rL8RebbpebrWj1OwMowZwC2xR6f7J7J68tKw8DZbuzpt+Mgk7Bt0WBcKMVCIdsSwYYvgpfaCsM+PGXnKFFsDRztWLuoVAyWx9eWFFZC3KonSuNomkK/YHkdzNRLvKzBLb6tIWH/FJ4hyM1d5LZBA+6bZ0OZftf8D6Y7Kq70pwMsxCfouRFocx+PXU5OVpU+Sc+leu11Eyr22QeL7ZPh4h0gDojj7b9nmHZbTFniuiFHLHPTQQr6SWoWRdNubPbttXOfFq9hhrjId2LH/SIh9ze4VE0F0Koi65y98aVLt1N7vnBhGWjAzmg10SX1aqcNCMccT/BWsiQnTJxxveELPb7XfDwkB4mV6VX37O7g0HGoWp+NFqEBGqy1+0QmBRYIi+gA0lSe4TWLqzR+1gEsy3Sd7oPD6ovo5hroUEtdjaQ5rXaKCB9ePIlkhUludx/2GJQDRRXiEsCrYF81DjvVQIZtSpkSNmpBU+eOUGwr44V1RZBrRGZ9UP+vLCi4ZAGHx/fP0uVYdSZIDTmCYF4ckw=="
        ]
        
        AF.request(
            endpoint,
            method: .post,
            parameters: quiz,
            encoder: JSONParameterEncoder.default,
            headers: header
        ).validate().responseDecodable(of: CreateQuizResponse.self){
            (response) in
            guard let APIresponse = response.value else {
                let errorMessage = StatusCodeMessage.getMessage(code: response.response!.statusCode)
                //log error
                os_log(errorMessage)
                //set completionHandler to false for fail
                completionHandler(false)
                
                print(response.debugDescription)
                return
            }
            
            print(APIresponse)
            
            completionHandler(true)
        }
        
    }
    
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
