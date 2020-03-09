//
//  EventsBusinessService.swift
//  iRevatureQuizPro
//
//  Created by Kjay Shieu on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

//calls the persistance layer to store the info into the database
class EventBusinessService {
    static func insert(attendeeData data: Event) {
        Events.insert(eventName: data.eventName, location: data.location, eventCode: data.eventCode, quizID: data.quizID, ambassadorEmail: data.ambassadorEmail, date: data.date)
    }
}
