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
    var createdBy: Int
    var createdOn: String
    var currentLoginTime: String
    var previousLoginTime: String
    var updatedBy: Int
    var updatedOn: String
    var passwordResetRequest: Bool
    var passwordResetToken: String
    var isFirstLogin: Bool
    var isAdminV2Opted: Bool
    var password: String
    var ip: String
    var location: String
    var timeZone: String
    var locale: String
    var sessionId: String
    var employeeId: Int
    var activeStatus: String
    var displayFirstName: String
    var displayLastName: String
    var displayFullName: String
    var displayRoles: String
    var displayEmail: String
    var killSessionManually: Bool
    var fromIdleMonitor: Bool
    var currentSystemRole: CurrentSystemRole
    var switchUserSystemRole: Bool
    var systemUserRoles: [CurrentSystemRole]
    var orgSystemUsers: [OrgSystemUser]
    var primaryOrganization: Organization
    var currentOrganization: Organization
    var loginToken: String
    var encryptedLoginToken: String
    var tokenExpTime: Int
    var regenThreshold: Int
    var validEmployee: Bool
    var actualUserId: Int
    var roleCode: String
    var orgId: Int
}
