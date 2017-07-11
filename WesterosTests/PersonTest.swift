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
    
    var starkHouse : House!
    var starkSigil : Sigil!
    var lannisterHouse : House!
    var lannisterSigil : Sigil!
    var ned    : Person!
    var robb   : Person!
    var arya    : Person!
    var tyrion   : Person!
    
    override func setUp() {
        super.setUp()
        
        starkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        
        lannisterSigil = Sigil (description: "Rampant Lion", image: #imageLiteral(resourceName: "lannister.jpg"))
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
        
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterExistence() {
        
        XCTAssertNotNil(ned)
        
        let samsa = Person(name: "Samsa", house: starkHouse)
        XCTAssertNotNil(samsa)
    }
    
    func testFullName(){
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testPersonEquality(){
        
        //Identidad
        XCTAssertEqual(ned, ned)
        
        // Igualdad
        let ned2 = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        XCTAssertEqual(ned, ned2)
        
        // Desigualdad
        XCTAssertNotEqual(ned, robb)
    }
    
    func testCompareOrderPersons(){
        XCTAssertTrue(ned < robb)
        XCTAssertFalse(arya > tyrion)
    }

}
