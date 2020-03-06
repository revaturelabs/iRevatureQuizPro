//
//  UserInfoBusinessService.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class UserInfoBusinessService {
    
    static let defaults = UserDefaults.standard
    
    
    static func setUserInfo(userObject: UserInfo) -> Bool {
        
        do{
            
            try defaults.set(PropertyListEncoder().encode(userObject), forKey: "UserInfo")
            
            return true
            
        } catch {
            return false
        }
    }
    
    
    static func getUserInfo() -> UserInfo? {
        
        if let decodedUserInfo = (defaults.value(forKey: "UserInfo")) {
            let user = try? PropertyListDecoder().decode(UserInfo.self, from: decodedUserInfo as! Data)
            
            return user
        }
        
        return nil
        
    }
    
}
