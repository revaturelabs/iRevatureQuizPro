//
//  StatusCodeMessages.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class StatusCodeMessage {
    
    static func getMessage(code: Int) -> StaticString {
        if code == 400 {
            return "400: Bad request"
        } else if code == 401 {
            return "401: Unauthorized"
        } else if code == 404 {
            return "404: Not found"
        } else if code == 422 {
            return "422: Unprocessable Entity"
        } else if code == 504 {
            return "504: Gateway Timeout"
        } else if code >= 500 && code < 600 {
            return "Server Error"
        } else {
            return "Error"
        }
    }
    
}
