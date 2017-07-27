//
//  ChapterTests.swift
//  Westeros
//
//  Created by Gema on 23/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodesTest: XCTestCase {

    var episode1x01: Episode!
    var episode1x02: Episode!

    var season01: Season!
    
    
    override func setUp() {
        super.setUp()
        
        season01 = Season(number: 1, initDate: DateFormatter.formatDate(date: "2011/04/17")!, finalDate: DateFormatter.formatDate(date: "2011/06/19")!)
        
        episode1x01 = Episode(number: 1, title: "Winter Is Coming", airDate: DateFormatter.formatDate(date: "2012-04-01")!, summary: "This is the first chapter ever on GOT", season: season01)
        episode1x02 = Episode(number: 2, title: "The Kingsroad", airDate: DateFormatter.formatDate(date: "2012-04-01")!, summary: "This is the second chapter  on GOT", season: season01)

        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEpisodeExistence(){
        XCTAssertNotNil(episode1x01)
        XCTAssertNotNil(episode1x02)
    }
    
    func testCompareEpisodes(){
        XCTAssertNotEqual(episode1x01, episode1x02)
        
        XCTAssertTrue(episode1x02 > episode1x01)
        XCTAssertTrue(episode1x01 < episode1x02)
    }
    
    func testEpisodeEquality(){
        XCTAssertNotEqual(episode1x01, episode1x02)
        
        XCTAssertEqual(episode1x02, episode1x02)
    }
    
    func testHashable(){
        XCTAssertNotNil(episode1x02.hashValue)
    }
    
    func testAddCharacter(){
        let robb = Repository.local.findPerson(personName: "Robb")
        let cersei = Repository.local.findPerson(personName: "Cersei")
    
        
        episode1x01.addMember(person: robb!)
        XCTAssertEqual(episode1x01.count, 1)
        
        episode1x01.addMember(person: robb!)
        XCTAssertEqual(episode1x01.count, 1)
        
        episode1x01.addMember(person: cersei!)
        XCTAssertEqual(episode1x01.count, 2)
        
        episode1x02.addMember(person: robb!)
        XCTAssertEqual(episode1x02.count, 1)
        XCTAssertEqual(episode1x01.count, 2)
    }
    
  }
