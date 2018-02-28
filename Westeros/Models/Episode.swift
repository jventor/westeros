//
//  Episode.swift
//  Westeros
//
//  Created by Jaime Ventor on 22/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import Foundation

// MARK: - Class: Episode
final class Episode {
    // MARK: - Properties
    let title : String
    let issueDate : Date
    weak var season: Season?
    
    // MARK: - Inicialization
    init(title: String, issueDate: String, season: Season){
        self.title = title
        self.issueDate = issueDate.toDate(format: Const.DateFormat)!
        self.season = season
    }
}

// MARK: - Proxy
extension  Episode {
    var proxyForEquality: String {
        return "\(title)"
    }
    
    var proxyForComparison: Date {
        return issueDate
    }
}

// MARK: - CustomStringConvertible
extension Episode: CustomStringConvertible {
    var description: String {
        return "\(title)"
    }
}

// MARK: - Equatable
extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Hashable
extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

