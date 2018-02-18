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

// MARK: - Proxies
extension Person{
    var proxy: String {
        return "\(name) \(alias) \(house.name)"
    }
    
    var proxyForComparison: String {
        return name.uppercased()
    }
}

// MARK: - Hashable
extension Person: Hashable {
    var hashValue: Int{
        return proxy.hashValue
    }
}

// MARK: - Equatable
extension Person: Equatable{
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
    
    
}

// MARK: - Comparable

extension Person: Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}




