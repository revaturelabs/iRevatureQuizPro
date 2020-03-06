//
//  LoginService.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class LoginService {
    
    static func validateUser(email:String, password:String, keepLoggedIn: Bool) -> Bool {
        TrainerLoginAccess.getUserLogin(email: email, password: password, completionHandler: {(trainer) in
            let user = UserInfo(id: trainer.id, empId: trainer.employeeId, username: trainer.displayEmail, name: trainer.displayFullName, role: trainer.currentSystemRole.name, token: trainer.encryptedLoginToken, keepLoggedIn: keepLoggedIn)
            
            let setUser = UserInfoBusinessService.setUserInfo(userObject: user)
            })
        return true
    }
    
}
