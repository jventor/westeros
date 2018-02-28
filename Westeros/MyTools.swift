//
//  MyTools.swift
//  Westeros
//
//  Created by Jaime Ventor on 28/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import Foundation

    func strToDate(date: String, dateFormat: String) -> Date {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = dateFormat
        return dateStringFormatter.date(from: date)!
    }


