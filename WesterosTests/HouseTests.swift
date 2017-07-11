//
//  HouseTests.swift
//  Westeros
//
//  Created by Gema on 6/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
    var starkImage : UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var houseList : Houses!
    
    var robb: Person!
    var arya : Person!
    var tyrion : Person!
    
    override func setUp() {
        super.setUp()
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(description: "Direwolf", image: starkImage)
        lannisterSigil = Sigil (description: "Rampant Lion", image: lannisterImage)
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        houseList = Houses()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence(){
        
        XCTAssertNotNil(starkHouse)
    }
    
    func testSigilExistence(){
        XCTAssertNotNil(starkSigil)
        
        
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons(){
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.addPerson(person: robb)
        
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.addPerson(person: arya)
        
        XCTAssertEqual(starkHouse.count, 2)
        
        XCTAssertEqual(lannisterHouse.count, 0)
        starkHouse.addPerson(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
    }
    
    func testCompareHouses(){
        XCTAssertNotEqual(starkHouse, lannisterHouse)
        
        XCTAssertTrue(starkHouse > lannisterHouse)
        XCTAssertFalse(starkHouse < lannisterHouse)
    }
    
    func testHashable(){
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseEquality(){
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad
        let starkHouse2 = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        XCTAssertEqual(starkHouse, starkHouse2)
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testAddHouse(){
        houseList.addHouse(house: starkHouse)
        XCTAssertEqual(houseList.count, 1)
        
        houseList.addHouse(house: lannisterHouse)
        XCTAssertEqual(houseList.count, 2)
        
        houseList.addHouse(house: lannisterHouse)
        XCTAssertEqual(houseList.count, 2)
    }
}
