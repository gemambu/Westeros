//
//  SeasonTests.swift
//  Westeros
//
//  Created by Gema on 23/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
    var season01: Season!
    var season02: Season!
    var episode1x01: Episode!
    var episode1x02: Episode!
    
    override func setUp() {
        super.setUp()
        
        season01 = Season(number: 1, initDate: "2011/04/17", finalDate: "2011/06/19")
        season02 = Season(number: 2, initDate: "2012/04/01", finalDate: "2012/06/03")

        episode1x01 = Episode(number: 1, title: "Winter Is Coming", summary: "This is the first chapter ever on GOT")
        episode1x02 = Episode(number: 2, title: "The Kingsroad", summary: "This is the second chapter  on GOT")

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExistence(){
        XCTAssertNotNil(season01)
    }
    
    func testCompareSeason(){
        XCTAssertTrue(season01 < season02)
        XCTAssertFalse(season01 > season02)
        
    }
    
    func testSeasonEquality(){
        XCTAssertEqual(season02, season02)
        XCTAssertNotEqual(season01, season02)
    }
    
    func testHashable(){
        XCTAssertNotNil(season01.proxy)
    }
    
    func testAddEpisode(){
        season01.addEpisode(episode: episode1x01)
        XCTAssertEqual(season01.count, 1)
        
        season01.addEpisode(episode: episode1x01)
        XCTAssertEqual(season01.count, 1)
        
        season01.addEpisode(episode: episode1x02)
        XCTAssertEqual(season01.count, 2)
    }
    
    func testFindEpisode(){
        var ep1x01 = season01.findEpisode(title: "Winter Is Coming")
        XCTAssertNil(ep1x01)
        
        season01.addEpisode(episode: episode1x01)
        ep1x01 = season01.findEpisode(title: "Winter Is Coming")
        XCTAssertNotNil(ep1x01)

    }
    
    func testFindAllEpisodes(){
        season01.addEpisode(episode: episode1x02)
        season01.addEpisode(episode: episode1x01)
        
        let episodes = season01.sortedEpisodes()
        XCTAssertNotNil(episodes)
        XCTAssertEqual(episodes.count, 2)
        XCTAssertEqual(episodes[0].number, 1)
        XCTAssertEqual(episodes[1].number, 2)
    }
    
}
