//
//  EventAttendeePersistenceService.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

class EventAttendeePersistenceService {
    static func insert(attendeeData data: BEventAttendeeSignUpInputData) {
        PEventAttendee.insert(firstName: data.firstName!, lastName: data.lastName!, email: data.email!, phoneNumber: data.phone!, major: data.major!, highestEducation: data.highestEducation!, worthAuthority: data.workAuthorization!)
    }
    
    static func getAttendeeInfo(byID: Int) -> BEventAttendeeInfo? {
        guard let retrievedInfo = PEventAttendee.getBy(id: byID) else { return nil }
        var attendeeInfo = BEventAttendeeInfo()
        attendeeInfo.firstName = retrievedInfo.first_name
        attendeeInfo.lastName = retrievedInfo.last_name
        attendeeInfo.email = retrievedInfo.email
        attendeeInfo.phone = retrievedInfo.phone
        attendeeInfo.highestEducation = retrievedInfo.highest_education
        attendeeInfo.workAuthorization = retrievedInfo.work_authorization
        
        return attendeeInfo
    }
}
