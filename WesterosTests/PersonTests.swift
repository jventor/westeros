//
//  CharaterTests.swift
//  WesterosTests
//
//  Created by Jaime Ventor on 8/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {
    
    var starkHouse: House!
    var starkSigil: Sigil!
    var ned: Person!
    var arya: Person!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        ned = Person(name: "Eduard", alias: "Ned", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
}
    
    func testPersonExistence(){
        
        XCTAssertNotNil(ned)
        XCTAssertNotNil(arya)
    }
    
    func testFullName(){
        XCTAssertEqual(ned.fullName, "Eduard Stark")
    }
    
}
