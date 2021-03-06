//
//  House.swift
//  Westeros
//
//  Created by Jaime Ventor on 8/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

enum Houses: String {
    case Stark = "Stark"
    case Lannister = "Lannister"
    case Targaryen = "Targaryen"
    case Tyrell = "Tyrell"
    case Martell = "Martell"
    case Baratheon = "Baratheon"
    case Tully = "Tully"
    case Greyjoy = "Greyjoy"
    case Arryn = "Arryn"
    case Hightower = "Hightower"
    case Frey = "Frey"
}

typealias Words = String
typealias Members = Set<Person>

// MARK: - House
final class House {
    // MARK: - Properties
    let name: String
    let sigil: Sigil
    let words: Words
    let wikiURL: URL
    private var _members: Members
    
    // MARK: - Calculated properties
    var sortedMembers: [Person] {
        return _members.sorted()
    }
    
    // MARK: - Initialization
    init(name: String, sigil: Sigil, words: Words, url: URL){
        self.name = name
        self.sigil = sigil
        self.words = words
        self.wikiURL = url
        _members = Members()
    }
}

// MARK: - Class extension
extension House {
    var count: Int {
        return _members.count
    }
    
    func add(person: Person){
        guard person.house?.name == self.name else { return }
        _members.insert(person)
    }
    
    func add(persons: Person ...){
        persons.forEach { add(person: $0) }
    }
}

// MARK: - Proxy
extension  House {
    var proxyForEquality: String {
        return "\(name) \(words)"
    }
    
    var proxyForComparison: String {
        return name.uppercased()
    }
}

// MARK: - Equatable
extension House: Equatable{
    static func == (lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Hashable
extension House: Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension House: Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

// MARK: - Sigil
final class Sigil{
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String){
        self.image = image
        self.description = description
    }
}




