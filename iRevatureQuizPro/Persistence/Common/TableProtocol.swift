//
//  TableProtocol.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

protocol PersistenceTable {
    static var tableName: String { get }
    static var table: ESLTable { get }
}

