//
//  Login.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct UserInfo: Codable {
    var id: Int
    var empId: Int
    var email: String
    var name: String
    var role: String
    var token: String
    var keepLoggedIn: Bool
}
