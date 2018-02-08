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
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
}
    
    func testPersonExistence(){
        
        let ned = Person(name: "Edgarg", alias: "Ned", house: starkHouse)
        XCTAssertNotNil(ned)
        
        let arya = Person(name: "Arya", house: starkHouse)
        XCTAssertNotNil(arya)
    }
    
}
