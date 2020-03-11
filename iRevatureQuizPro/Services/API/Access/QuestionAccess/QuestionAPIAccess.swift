//
//  QuestionAccess.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import Alamofire
import os.log


class QuestionAPIAccess {
    
    static private let allEndpoint = "https://dev3-ms.revature.com/apigateway/quiz/secure/questions"
    static private let endpointByID = "https://dev3-ms.revature.com/apigateway/quiz/secure/question/"
    
    static func getAllQuestions(size: Int, page: Int, completionHandler: @escaping ([AllQuestionAPIData]?, Bool?) -> Void) {
        
        let body: QuestionBody = QuestionBody(size: size, page: page, sortOrder: "asc", orderBy: "title", ownedContent: false, isOrdered: false)
        
        let header = API.getHTTPHeader()
        
        AF.request(
            allEndpoint,
            method: .post,
            parameters: body,
            encoder: JSONParameterEncoder.default,
            headers: header
        ).validate().responseDecodable(of: AllQuestionAPIResponse.self){
            (response) in
            guard let APIresponse = response.value else {
                //get staticstring message
                let errorMessage = StatusCodeMessage.getMessage(code: response.response!.statusCode)
                //log error
                os_log(errorMessage)
                //set completionHandler to nil and true for no data and error
                completionHandler(nil, true)
                
                return
            }
            //set completionHandler to user.data and false for data and no error
            completionHandler(APIresponse.data, false)
        }
        
    }
    
    static func getQuestionByID(id: Int, completionHandler: @escaping (QuestionByIDAPIData?, Bool?) -> Void) {
        let endpoint = endpointByID + String(id)
        let header = API.getHTTPHeader()
        
        AF.request(
            endpoint,
            headers: header
        ).validate().responseDecodable(of: QuestionByIDAPIResponse.self){
            (response) in
            guard let APIresponse = response.value else {
                //get staticstring message
                let errorMessage = StatusCodeMessage.getMessage(code: response.response!.statusCode)
                //log error
                os_log(errorMessage)
                //set completionHandler to nil and true for no data and error
                completionHandler(nil, true)
                
                return
            }
            //set completionHandler to user.data and false for data and no error
            completionHandler(APIresponse.data, false)
        }
        
    }
}
