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
    
    override func setUp() { // se ejecuta antes de cada test
        super.setUp()
        starkSigil   = Sigil(image: UIImage(), description: "Lobo Huargo")
        lannisterSigil = Sigil(image: UIImage(), description: "León rampante")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!)
        
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
    
//    func testAddPersons(){
//        XCTAssertEqual(starkHouse.count,0)
//
//        starkHouse.add(person: robb)
//        XCTAssertEqual(starkHouse.count,1)
//
//        starkHouse.add(person: arya)
//        XCTAssertEqual(starkHouse.count,2)
//
//        starkHouse.add(person: tyrion)
//        XCTAssertEqual(starkHouse.count,2, "No se debe añadir Tyrion a la casa Stark")
//
//       let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
//        let cersei = Person(name: "Cersei", house: lannisterHouse)
//        lannisterHouse.add(persons: jaime, cersei)
//        XCTAssertEqual(lannisterHouse.count,2)
//    }
  
    func testHouseEquality(){
        // Identidad
        
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad
        
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
       // let jinxed = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertEqual(jinxed, starkHouse)
        
        // Desugualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHashable(){
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison(){
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
 
    func testPersonSorted(){
        let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        lannisterHouse.add(persons: jaime, cersei, tyrion ) // jaime, cersei, tyrion
        //XCTAssertEqual(lannisterHouse.count,3)
        let lannisterSorted = lannisterHouse.sortedMembers
       XCTAssertEqual(lannisterSorted, [cersei, jaime,tyrion])
    }
}





