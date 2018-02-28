//
//  Date+Additions.swift
//  Westeros
//
//  Created by Jaime Ventor on 24/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import Foundation

extension Date {
    var description : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Const.DateFormat
        return dateFormatter.string(from: self)
    }
}




