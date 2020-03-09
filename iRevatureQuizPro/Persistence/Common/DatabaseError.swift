//
//  DatabaseError.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

struct DatabaseErrorMessage {
    static let open: StaticString = "Failed to open database"
    static let create: StaticString = "Failed to create %s table"
    static let drop: StaticString = "Failed to drop %s table"
    static let insert: StaticString = "Failed to insert row into %s table"
    static let delete: StaticString = "Failed to remove row from %s table"
    static let update: StaticString = "Failed to update row from %s table"
    static let select: StaticString = "Failed to receive data from select"
}
