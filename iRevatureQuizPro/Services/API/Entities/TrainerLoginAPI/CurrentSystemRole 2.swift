//
//  CurrentSystemRole.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct CurrentSystemRole: Codable {
    var id: Int
    var code: String
    var description: String
    var hierarchy: Int
    var isActive: Bool
    var name: String
    var isOrgRoleActive: Bool
}
