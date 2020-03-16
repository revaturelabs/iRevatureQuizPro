//
//  TrainerLogInResponse.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct TrainerLoginAPIResponse: Codable {
    var statusCode: Int
    var description: String
    var data: TrainerLoginData
}
