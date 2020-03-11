//
//  QuizAPIData.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

// First set of data we receive from API
struct APIQuizResults: Codable {
    var statusCode:Int
    var description:String
    var data:[QuizAPIData]
    
}

// Models a single individual quiz record, that is received from the API
struct QuizAPIData: Codable {
    var id: Int
    var title: String
    var categoryId: String
    var metaTags: String
    var quizDuration: Int
}

// Body of the API request
struct QuizBody: Codable{
    // Size is how many reccords are being requested
    var size: Int
    var page: Int
    var sortOrder: String
    var orderBy: String
    var subscribedContent: Bool
    var publicContent: Bool
    var ownContent: Bool
    var isOrdered: Bool
}

struct APIQuizByIDResults {
    var statusCode:Int
    var description:String
    var data:[QuizByIDAPIData]
}

struct QuizByIDAPIData{
    
}
