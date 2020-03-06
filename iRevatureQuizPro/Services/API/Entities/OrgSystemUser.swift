//
//  OrgSystemUser.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct OrgSystemUser: Codable {
        var id: Int
        var organization: Organization
        var isActive: Bool
        var currentSystemRole: CurrentSystemRole
        var systemUserRoles: CurrentSystemRole
}
