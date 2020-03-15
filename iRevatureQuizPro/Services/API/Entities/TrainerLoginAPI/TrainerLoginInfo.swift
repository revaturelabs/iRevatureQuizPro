//
//  TrainerLoginInfo.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct TrainerLoginInfo: Codable {
    var userName:String
    var password:String
    var timeZone = TimeZone.current.identifier
    
}
