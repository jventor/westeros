//
//  Characther.swift
//  Westeros
//
//  Created by Jaime Ventor on 8/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import Foundation

final class Person {
    let name: String
    let house: House
    private let _alias: String?
    
    /*
    var alias: String {
        if let _alias = _alias {
            // Existe y esta en alias
            return _alias
        } else {
            return ""
        }
    }
    */
    
    var alias: String {
        return _alias ?? ""
    }
    
    init(name:String, alias: String? = nil, house: House){
        self.name = name
        _alias = alias
        self.house = house
    }
}

extension Person {
    var fullName: String {
        return "\(name) \(house.name)"
    }
}



