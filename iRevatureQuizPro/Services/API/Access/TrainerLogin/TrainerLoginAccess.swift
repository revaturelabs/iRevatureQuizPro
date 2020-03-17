//
//  TrainerLoginAccess.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import Alamofire
import os.log

class TrainerLoginAccess {
    
    //endpoint for user login
//    static private let endpoint = "https://dev3-ms.revature.com/apigateway/security/admin/login"
    
    //function to log into API, completion handler has optional
    static func getUserLogin(email: String, password: String, completionHandler: @escaping (TrainerLoginData?, Bool?) -> Void) {
        
        //create login details struct
        let login = TrainerLoginInfo(userName: email, password: password)
        //create header for request
        let header:HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        AF.request(
            APIEndpoint.trainerLogin,
            method: .post,
            parameters: login,
            encoder: JSONParameterEncoder.default,
            headers: header
        ).validate().responseDecodable(of: TrainerLoginAPIResponse.self){
            (response) in
            guard let user = response.value else {
                //get staticstring message
                let errorMessage = StatusCodeMessage.getMessage(code: response.response!.statusCode)
                //log error
                os_log(errorMessage)
                //set completionHandler to nil and true for no data and error
                completionHandler(nil, true)
                
                return
            }
            //set completionHandler to user.data and false for data and no error
            completionHandler(user.data, false)
        }
    }
}
