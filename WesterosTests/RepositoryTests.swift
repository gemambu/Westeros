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
    
    var localhouses : [House]!
    
    override func setUp() {
        super.setUp()
        localhouses = Repository.local.houses
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
        XCTAssertEqual(houses.count, 3)
        XCTAssertEqual(houses.first, Repository.local.findHouse(name: "Lannister"))
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
    
    func testReturnsSortedHousesArray(){
        XCTAssertEqual(Repository.local.houses.first?.name, "Lannister")
        XCTAssertEqual(localhouses.sorted(), localhouses)
    }
    
    func testReturnsHouseByName(){
        var houseFound = Repository.local.findHouse(name: "stark")
        XCTAssertNotNil(houseFound)
        
        houseFound = Repository.local.findHouse(name: "StArK")
        XCTAssertNotNil(houseFound)
        
        XCTAssertEqual(houseFound?.name, "Stark")
        
        let grijander = Repository.local.findHouse(name: "Grijander")
        XCTAssertNil(grijander)

    }
    
    func testHouseFiltering(){
        let filtered = Repository.local.houses(filteredBy: {$0.count == 3})
        XCTAssertEqual(filtered.count, 3)


    }

    
}
