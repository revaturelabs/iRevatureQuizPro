//
//  UserInfoBusinessService.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import os.log

class UserInfoBusinessService {
    
    static let defaults = UserDefaults.standard
    
    //set userdefaults
    static func setUserInfo(userObject: UserInfo) {
        
        do{
            
            try defaults.set(PropertyListEncoder().encode(userObject), forKey: "UserInfo")

            os_log("UserDefaults successfully stored")
            
        } catch {
            os_log("UserDefaults not stored")
        }
    }
    
    //get user from userdefaults
    static func getUserInfo() -> UserInfo? {
        
        if let decodedUserInfo = (defaults.value(forKey: "UserInfo")) {
            let user = try? PropertyListDecoder().decode(UserInfo.self, from: decodedUserInfo as! Data)
            
            return user
        }
        
        return nil
        
    }
    
}
