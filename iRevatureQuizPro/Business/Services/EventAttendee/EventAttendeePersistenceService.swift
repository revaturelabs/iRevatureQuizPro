//
//  EventAttendeePersistenceService.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

class EventAttendeePersistenceService {
    static func insert(attendeeData data: BEventAttendee) {
        PEventAttendee.insert(firstName: data.firstName, lastName: data.lastName, email: data.email, phoneNumber: data.phone, major: data.major, highestEducation: data.highestEducation, worthAuthority: data.workAuthorization)
    }
}
