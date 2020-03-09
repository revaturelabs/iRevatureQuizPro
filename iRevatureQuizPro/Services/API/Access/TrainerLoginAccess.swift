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
    
    static private let endpoint = "https://dev3-ms.revature.com/apigateway/security/admin/login"
    
    static func getUserLogin(email: String, password: String, completionHandler: @escaping (TrainerLoginData?, StaticString?) -> Void) {
        
        let login = TrainerLoginInfo(userName: email, password: password)
        
        let header:HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        AF.request(
            endpoint,
            method: .post,
            parameters: login,
            encoder: JSONParameterEncoder.default,
            headers: header
        ).validate().responseDecodable(of: TrainerLoginAPIResponse.self){
            (response) in
            guard let user = response.value else {
                let errorMessage = StatusCodeMessage.getMessage(code: response.response!.statusCode)
                
                os_log(errorMessage)
                
                completionHandler(nil, errorMessage)
                
                return
            }
            
            completionHandler(user.data, "Login successful")
        }
    }
    
}
