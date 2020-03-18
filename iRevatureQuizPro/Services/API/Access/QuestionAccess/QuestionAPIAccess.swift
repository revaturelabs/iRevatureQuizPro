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
    
    //function to get all questions using size and page
    static func getAllQuestions(size: Int, page: Int, completionHandler: @escaping ([QuestionData]?, Bool?) -> Void) {
        //Create question body struct to send as request
        let body: QuestionBody = QuestionBody(size: size, page: page, sortOrder: "asc", orderBy: "title", ownedContent: false, isOrdered: false)
        //get header for API request
        let header = API.getHTTPHeader()
        
        AF.request(
            APIEndpoint.allQuestions,
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
                print(response.debugDescription)
                //set completionHandler to nil and true for no data and error
                completionHandler(nil, true)
                
                
                return
            }
            //set completionHandler to user.data and false for data and no error
            completionHandler(APIresponse.data, false)
        }
        
    }
    
    
    //function to get questions using ID
    static func getQuestionByID(id: Int, completionHandler: @escaping (QuestionData?, Bool?) -> Void) {
        //append id to endpoint for request
        let endpoint = APIEndpoint.question + String(id)
        //get header for API request
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
                print(response.debugDescription)
                //set completionHandler to nil and true for no data and error
                completionHandler(nil, true)
                
                return
            }
            //set completionHandler to user.data and false for data and no error
            completionHandler(APIresponse.data, false)
        }
        
    }
}
