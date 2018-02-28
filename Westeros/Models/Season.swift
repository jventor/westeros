//
//  Season.swift
//  Westeros
//
//  Created by Jaime Ventor on 22/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

typealias Episodies = Set<Episode>

// MARK: - Class: Season
final class Season {
    // MARK: - Properties
    let name: String
    let releaseDate : Date
    let image: UIImage
    private var _episodies : Episodies
    
    // MARK: - Calculated properties
    var sortedEpisodes: [Episode] {
        return _episodies.sorted()
    }
    
    // MARK: - Inicialization
    init(name: String, releaseDate: String, image: UIImage){
        self.name = name
        self.releaseDate = releaseDate.toDate(format: Const.DateFormat)!
        self._episodies = Episodies()
        self.image = image
    }
}

// MARK: - Class extension: Season
extension Season {
    var count : Int {
        return _episodies.count
    }
    
    func add(episode: Episode) {
        guard self.name == episode.season?.name else { return }
        _episodies.insert(episode)
    }
    
    func add(episodies: Episode ...){
        episodies.forEach { add(episode: $0 ) }
    }
}

// MARK: - Proxy
extension  Season {
    var proxyForEquality: String {
        return "\(name)"
    }
    
    var proxyForComparison: Date {
        return releaseDate
    }
}

// MARK: - CustomStringConvertible
extension Season: CustomStringConvertible {
    var description: String {
        return "\(name)"
    }
}

// MARK: - Equatable
extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Hashable
extension Season: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

