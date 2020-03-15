//
//  API.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import Alamofire

class API {
    
    static func getHTTPHeader() -> HTTPHeaders? {
        
        let user = UserInfoBusinessService.getUserInfo()
        
        guard let token = user?.token else {
            return nil
        }
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "encryptedToken": token
        ]
        
        return header
    }
    
}
