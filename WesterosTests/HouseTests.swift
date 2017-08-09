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
    
    var robb: Person!
    var arya : Person!
    var tyrion : Person!
    
    
    let houseList = Repository.local.houses
    
    override func setUp() {
        super.setUp()
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(description: "Direwolf", image: starkImage)
        lannisterSigil = Sigil (description: "Rampant Lion", image: lannisterImage)
    
        starkHouse = Repository.local.findHouse(name: "Stark")
        lannisterHouse = Repository.local.findHouse(name: "Lannister")
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse, character: "")
        arya = Person(name: "Arya", house: starkHouse, character: "")
        tyrion = Person(name: "Tyrion", alias: "The Imp",  house: lannisterHouse, character: "")

        
        
        
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
        let starkHouse2 = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertEqual(starkHouse2.count, 0)
        starkHouse2.addPerson(person: robb)
        
        XCTAssertEqual(starkHouse2.count, 1)
        starkHouse2.addPerson(person: arya)
        
        XCTAssertEqual(starkHouse2.count, 2)
        
        let lannisterHouse2 = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: URL(string: "http://awoiaf.westeros.org/index.php/Lannister")!)
        XCTAssertEqual(lannisterHouse2.count, 0)
        starkHouse2.addPerson(person: tyrion)
        XCTAssertEqual(starkHouse2.count, 2)
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
        let starkHouse2 = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertEqual(starkHouse2, starkHouse2)
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testFindHouse(){
        let house = Repository.local.findHouse(name: "Stark")
        XCTAssertEqual(house?.name, "Stark")
        
        let starkSigil = Sigil(description: "Direwolf", image: starkImage)
        XCTAssertEqual(house?.sigil.description, starkSigil.description)
        
        let nilHouse = Repository.local.findHouse(name: "Jarl")
        XCTAssertNil(nilHouse)
    }
    
    func testGetSortedMembers(){
        let members = starkHouse.sortedMembers()
        XCTAssertEqual(members[0].name, "Arya")
    }
}
