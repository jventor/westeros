//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Jaime Ventor on 22/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
    var season1 : Season!
    var season2 : Season!
    var episode1_1 : Episode!
    var episode1_2 : Episode!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        season1 = Season(name: "Season 1", releaseDate: "17/04/2011", image: #imageLiteral(resourceName: "Season1.jpg"))
        season2 = Season(name: "Season 2", releaseDate: "01/04/2012", image: #imageLiteral(resourceName: "Season2.jpg"))
        
        episode1_1 = Episode(title: "Winter Is Coming", issueDate: "17/04/2011", season: season1)
        episode1_2 = Episode(title: "The Kingsroad", issueDate: "24/04/2011", season: season1)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence(){
        XCTAssertNotNil(season1)
        XCTAssertNotNil(season2)
    }

    func testSeasonCustomStringConvertible(){
        XCTAssertEqual(season1.description, "Season 1")
        XCTAssertEqual(season2.description, "Season 2")
    }
    
    func testSeasonEquality(){
        // Identidad
        XCTAssertEqual(season1, season1)
        
        //Igualdad
        let auxSeason = Season(name: "Season 1", releaseDate: "17/04/2011",image: #imageLiteral(resourceName: "Season1.jpg"))
        XCTAssertEqual(season1, auxSeason)
        
        //Desigualdad
        XCTAssertNotEqual(season1, season2)
    }
    
    func testSeasonHashable(){
        XCTAssertNotNil(season1.hashValue)
    }
    
    func testSeasonComparison(){
        XCTAssertLessThan(season1, season2)
    }
    
    func testAddEpisodies(){
        XCTAssertEqual(season1.count, 0)
        
        season1.add(episode: episode1_1)
        XCTAssertEqual(season1.count, 1)
        
        
        season1.add(episode: episode1_2)
        XCTAssertEqual(season1.count, 2)
        
        season1.add(episode: episode1_2)
        XCTAssertEqual(season1.count, 2)
        
        let episode2_1 = Episode(title: "The North Remembers", issueDate: "01/04/2012", season: season2)
        season1.add(episode: episode2_1)
        XCTAssertEqual(season1.count, 2)
    }
    
}
