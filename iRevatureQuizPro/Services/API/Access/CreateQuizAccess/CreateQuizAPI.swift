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
    
    static func createNewQuiz(quiz: CQBody, completionHandler: @escaping (_ didCreate: Bool) -> Void) {
        
        //get header
        let header = API.getHTTPHeader()
        
        AF.request(
            APIEndpoint.quiz,
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
