//
//  EventAttendee.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

struct BEventAttendeeInfo {
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
    var phone: Int
    var major: String
    var highestEducation: String
    var workAuthorization: String
}

extension BEventAttendeeInfo {
    init() {
        id = Int()
        firstName = String()
        lastName = String()
        email = String()
        phone = Int()
        major = String()
        highestEducation = String()
        workAuthorization = String()
    }
}

//Used to assign input from Attendee Signup table
struct BEventAttendeeSignUpInputData {
    var firstName: String?
    var lastName: String?
    var email: String?
    var phone: Int?
    var major: String?
    var highestEducation: String?
    var workAuthorization: String?
    
    //Custom function to allow for iteration over data in struct
    mutating func input(atIndex: Int, value: String) -> Bool {
        switch atIndex {
        case 0:
            firstName = value
            return true
        case 1:
            lastName = value
            return true
        case 2:
            email = value
            return true
        case 3:
            guard let input = Int(value) else { return false }
            phone = input
            return true
        case 4:
            major = value
            return true
        case 5:
            highestEducation = value
            return true
        case 6:
            workAuthorization = value
            return true
        default:
            return false
        }
    }
}
