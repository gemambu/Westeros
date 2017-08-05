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
    var localseasons : [Season]!
    
    override func setUp() {
        super.setUp()
        localhouses = Repository.local.houses
        localseasons = Repository.local.seasons
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        XCTAssertNotNil(Repository.local)
    }
    
//MARK: - HOUSES
    
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
    
//MARK: - SEASONS
    func testLocalRepositorySeasonsCreation(){
        let seasons = Repository.local.seasons
        XCTAssertEqual(seasons.count, 7)
        XCTAssertEqual(seasons.first, Repository.local.findSeason(number: 1))
    }
    
    func testLocalRepositoryFilterByEpisode(){
        let episode = Repository.local.findEpisode(episodeTitle: "GARDEN of Bones")
        XCTAssertNotNil(episode)
        XCTAssertEqual(episode?.number, 4)
        XCTAssertEqual(episode?.title, "Garden of Bones")
        
        let nilEpisode = Repository.local.findEpisode(episodeTitle: "Sponje bob")
        XCTAssertNil(nilEpisode)
    }
    
    func testReturnsSortedSeasonsArray(){
        XCTAssertEqual(Repository.local.seasons.first?.number, 1)
        XCTAssertEqual(localseasons.sorted(), localseasons)
    }
    
    func testReturnsSeasonByNumber(){
        var seasonFound = Repository.local.findSeason(number: 2)
        XCTAssertNotNil(seasonFound)
        XCTAssertEqual(seasonFound?.count, 10)
        
        seasonFound = Repository.local.findSeason(number: 222)
        XCTAssertNil(seasonFound)
        
    }
    
    func testSeasonFiltering(){
        var filtered = Repository.local.seasons(filteredBy: {$0.count == 10})
        XCTAssertEqual(filtered.count, 2)
        
        filtered = Repository.local.seasons(filteredBy: {$0.count == 15})
        XCTAssertEqual(filtered.count, 0)
        
    }

//    func testRepositorySummaries() {
//        let summary = Repository.local.getSummary(episode: 101)
//        XCTAssertNotNil(summary)
//
//    }
}
