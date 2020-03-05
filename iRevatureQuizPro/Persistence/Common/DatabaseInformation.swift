//
//  DatabaseInformation.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import EasySQLite

struct DatabaseInfo {
    static let name = "iRevatureQuizPro"
    static let directory = FileManager.SearchPathDirectory.documentDirectory
    static let domainMask = FileManager.SearchPathDomainMask.userDomainMask
    
    static var filePath: String? {
        return ESLDatabaseAccess.getDatabaseFilePath(name: name, pathDirectory: directory, domainMask: domainMask)
    }
}
