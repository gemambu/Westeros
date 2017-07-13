//
//  RepositoryTests.swift
//  Westeros
//
//  Created by Gema on 11/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros
class RepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation(){
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 2)
    }
    
    func testLocalRepositoryFilterByPerson(){
        let housePerson = Repository.local.findPerson(personName: "Robb")
        XCTAssertNotNil(housePerson)
        XCTAssertEqual(housePerson?.name, "Robb")
        XCTAssertEqual(housePerson?.alias, "The young wolf")
        XCTAssertEqual(housePerson?.house, Repository.local.findHouse(name: "Stark"))

        
        let ninlPerson = Repository.local.findPerson(personName: "Sponje bob")
        XCTAssertNil(ninlPerson)
    }

    
}
