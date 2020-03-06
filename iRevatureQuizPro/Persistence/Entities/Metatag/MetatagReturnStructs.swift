//
//  MetatagReturnStructs.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

//=====================================
    //Return Structs for data from Metatag Table
//=====================================
extension PMetatag {
    
//=====================================
    //Hold All Columns From Metatag Table
//=====================================
    struct MetatagAllData: Codable {
        var tag_id: Int
        var tag_name: String
    }
}
