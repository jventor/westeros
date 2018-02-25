//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Jaime Ventor on 22/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import XCTest
@testable import Westeros


class EpisodeTests: XCTestCase {
    
    var season1 : Season!
    var episode1: Episode!
    var episode2: Episode!
    
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        season1 = Season(name: "Season 1", releaseDate: "17/04/2011", image: #imageLiteral(resourceName: "Season1.jpg"))
        episode1 = Episode(title: "Winter Is Coming", issueDate: "17/04/2011", season: season1)
        episode2 = Episode(title: "The Kingsroad", issueDate: "24/04/2011", season: season1)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence(){
        XCTAssertNotNil(episode1)
    }
    
    func testEpisodeCustomStringConvertible(){
        XCTAssertEqual(episode1.description, "Winter Is Coming")
    }
    
    func testEpisodeEquality(){
        // Identidad
        XCTAssertEqual(episode1, episode1)
        
        
        // Igualdad
        let auxEpisode = Episode(title: "Winter Is Coming", issueDate: "17/04/2011", season: season1)
        XCTAssertEqual(episode1, auxEpisode)
        
        // Desigualdad
        XCTAssertNotEqual(episode1, episode2)
    }
    
    func testEpisodeHashable(){
        XCTAssertNotNil(episode1.hashValue)
    }
    
    func testEpisodeComparison(){
        XCTAssertLessThan(episode1, episode2)
    }
    
    func testAddEpisodiesToSeasono(){
        
    }
}
