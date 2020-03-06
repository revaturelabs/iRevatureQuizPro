//
//  EventAttendeeReturnStructs.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

//=====================================
    //Return Structs for data from Event Attendee Table
//=====================================
extension PEventAttendee {
    
//=====================================
    //Hold All Columns From Event Attendee Table
//=====================================
    struct EventAttendeeAllData: Codable {
        var tag_id: Int
        var first_name: String
        var last_name: String
        var email: String
        var phone: Int
        var major: String
        var highest_enducation: String
        var work_authorization: String
    }
    
//=====================================
    //Hold Full Name and Email Columns From Event Attendee Table
//=====================================
    struct EventAttendeeFullNameEmail: Codable {
        var first_name: String
        var last_name: String
        var email: String
    }
}
