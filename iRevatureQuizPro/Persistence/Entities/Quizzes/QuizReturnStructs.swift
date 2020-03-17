//
//  QuizReturnStructs.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse 3/5/2020.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//=====================================
    //Return Structs for data from Quiz Table
//=====================================
extension PQuiz {
    
//=====================================
//	Hold All Columns From Quiz Table //
//=====================================
	
	// Currently only holding the following values - the rest must be taken from the API
	// This is because the current API is too much redundant, unnecessary, and inconsistent data
	// Storing ~15,000 entries would make the database bloated - so we only store the identifiable and functional information
			
    struct QuizAllData : Codable {
		var id: Int
		var title: String
		var description: String
		var metaTags: String
		var categoryName: String
    }
}
