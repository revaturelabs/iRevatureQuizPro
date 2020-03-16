//
//  StaticData.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

struct AttendeeSignupData {
    var text: String
    var keyboardType: UIKeyboardType
    var pickerValues: [String]
}

struct AttendeeSignupFields {
   
    static let FirstName = AttendeeSignupData(text: "First Name", keyboardType: .default, pickerValues: [])
    static let LastName = AttendeeSignupData(text: "Last Name", keyboardType: .default, pickerValues: [])
    static let Email = AttendeeSignupData(text: "Email", keyboardType: .emailAddress, pickerValues: [])
    static let Phone = AttendeeSignupData(text: "Phone Number", keyboardType: .phonePad, pickerValues: [])
    static let Major = AttendeeSignupData(text: "Major", keyboardType: .default, pickerValues: [])
    static let HighestEduc = AttendeeSignupData(text: "Highest Level of Education", keyboardType: .default, pickerValues: LevelOfEducation.allLevels)
    static let WorkAuth = AttendeeSignupData(text: "Work Authorization", keyboardType: .default, pickerValues: WorkAuthorization.allTypes)
    
    static let allFields: [AttendeeSignupData] = [FirstName,
                                                  LastName,
                                                  Email,
                                                  Phone,
                                                  Major,
                                                  HighestEduc,
                                                  WorkAuth]
}

struct LevelOfEducation {
    static let HighSchool = "High School"
    static let Associate = "Associate's Degree"
    static let Bachelor = "Bachelor's Degree"
    static let Master = "Master's Degree"
    
    static let allLevels: [String] = [HighSchool,
                                      Associate,
                                      Bachelor,
                                      Master]
}

struct WorkAuthorization {
    static let UsCitizen = "U.S. Citizen"
    static let GreenCard = "Green Card"
    static let OPT = "OPT"
    static let OtherVisa = "Other Visa"
    
    static let allTypes: [String] = [UsCitizen,
                                     GreenCard,
                                     OPT,
                                     OtherVisa]
}
