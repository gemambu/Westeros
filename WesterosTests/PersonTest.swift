//
//  CharacterTest.swift
//  Westeros
//
//  Created by Gema on 6/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class CharacterTest: XCTestCase {
    
    let houseList = Repository.local.houses

    var starkHouse : House!
    var lannisterHouse : House!
    
    var ned    : Person!
    var robb   : Person!
    var arya    : Person!
    var tyrion   : Person!
    
    override func setUp() {
        super.setUp()
        
        starkHouse = Repository.local.findHouse(name: "Stark")
        lannisterHouse = Repository.local.findHouse(name: "Lannister")
        
        
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse, character: "")
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse, character: "")
        arya = Person(name: "Arya", house: starkHouse, character: "")
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse, character: "")

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterExistence() {
        
        XCTAssertNotNil(ned)
        
        let samsa = Person(name: "Samsa", house: starkHouse, character: "")
        XCTAssertNotNil(samsa)
    }
    
    func testFullName(){
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testPersonEquality(){
        
        //Identidad
        XCTAssertEqual(ned, ned)
        
        // Igualdad
        let ned2 = Person(name: "Eddard", alias: "Ned", house: starkHouse, character: "")
        XCTAssertEqual(ned, ned2)
        
        // Desigualdad
        XCTAssertNotEqual(ned, robb)
    }
    
    func testCompareOrderPersons(){
        XCTAssertTrue(ned < robb)
        XCTAssertFalse(arya > tyrion)
    }
    
    func testCreatePerson(){
        _ = Person(name: "Samsa", house: starkHouse, character: "")
        XCTAssertEqual(starkHouse.count, 4)
        
        _ = Person(name: "Samsa", house: starkHouse, character: "")
        XCTAssertEqual(starkHouse.count, 4)
        
        _ = Person(name: "Jaime Lannister", alias: "Kingslayer", house: lannisterHouse, character: "")
        XCTAssertEqual(starkHouse.count, 4)
        XCTAssertEqual(lannisterHouse.count, 4)
    }

}
