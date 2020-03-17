//
//  EventCell.swift
//  iRevatureQuizPro
//
//  Created by Nathan Coggins on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import UIKit

class EventCell: RevatureTableViewCell {
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var quiz: UILabel!
    @IBOutlet weak var imagesView: UIImageView!
}
