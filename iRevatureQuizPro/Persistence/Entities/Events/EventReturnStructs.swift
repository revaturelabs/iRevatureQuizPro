//
//  EventReturnStructs.swift
//  iRevatureQuizPro
//
//  Created by Nathan Coggins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

//=====================================
    //Return Structs for data from Events Table
//=====================================
extension Events {
    
//=====================================
    //Hold All Columns From Events Table
//=====================================
    struct EventsAllData: Codable {
        var event_name: String
        var location: String
        var event_code: String
        var quiz_id: Int
        var ambassador_email: String
        var date: String
    }
//=====================================
    //Hold Identifier Columns From Events Table
//=====================================
    struct EventCode: Codable {
        var event_name: String
        var event_code: String
        var ambassador_email: String
    }
}
