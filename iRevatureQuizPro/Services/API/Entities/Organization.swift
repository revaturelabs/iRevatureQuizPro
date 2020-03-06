//
//  Organization.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct Organization: Codable {
        var id: Int
        var name: String
        var aliasName: String
        var type: String
        var sfAccountId: String
        var sfAccountName: String
        var isContentSubscribed: Bool
        var isAllContentSubscribed: Bool
        var isActive: Bool
        var createdOn: String
        var createdBy: Int
        var modifiedOn: String
        var modifiedBy: Int
        var isRootOrganization: Bool
        var isAllVideoSubscribed: Bool
        var isAllQsnSubscribed: Bool
        var isEnabledUserVerification: Bool
        var isPaymentOptionEnabled: Bool
        var isSignUpPageActive: Bool
        var organizationCode: String
}
