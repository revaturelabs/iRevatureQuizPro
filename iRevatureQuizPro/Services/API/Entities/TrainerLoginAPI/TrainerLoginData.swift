//
//  TrainerLoginData.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct TrainerLoginData: Codable {
    var id: Int
    var userName: String
    var isActive: Bool
    var employeeId: Int
    var displayFullName: String
    var displayEmail: String
    var currentSystemRole: CurrentSystemRole
    var systemUserRoles: [CurrentSystemRole]
    var loginToken: String
    var encryptedLoginToken: String
    var tokenExpTime: Int
}
