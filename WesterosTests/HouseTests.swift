//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Jaime Ventor on 8/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    
    override func setUp() {
        super.setUp()
        starkSigil   = Sigil(image: UIImage(), description: "Lobo Huargo")
        lannisterSigil = Sigil(image: UIImage(), description: "León rampante")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido")
        
        robb = Person(name: "Robb", alias: "El joven Lobo", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "El  Enano", house: lannisterHouse)
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testHouseExistence(){

        XCTAssertNotNil(starkHouse)
        XCTAssertNotNil(lannisterHouse)
    }
    
    func testSigilExistence(){

        XCTAssertNotNil(starkSigil)
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons(){
        XCTAssertEqual(starkHouse.count,0)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count,1)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count,2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count,2, "No se debe añadir Tyrion a la casa Stark")
    }
}





