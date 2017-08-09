//
//  RepositoryUtilTest.swift
//  Westeros
//
//  Created by Gema on 9/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryUtilTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
            }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRepositorySummaries() {
        var summary = getSummary(number: 101, type: "EpisodeSummaries")
        XCTAssertNotNil(summary)
        
        summary = getSummary(number: 1, type: "SeasonSummaries")
        XCTAssertNotNil(summary)        
        
        summary = getSummary(number: 0, type: "SeasonSummaries")
        XCTAssertEqual(summary, "")
        
        summary = getSummary(number: 101, type: "NewFileName")
        XCTAssertEqual(summary, "")
        
        
        summary = getSummary(fullname: "Cersei Lannister", type: "PersonCharacters")
        XCTAssertNotNil(summary)
        
        summary = getSummary(fullname: "Other character", type: "PersonCharacters")
        XCTAssertEqual(summary, "")
        
        summary = getSummary(fullname: "Other character", type: "NewFileName")
        XCTAssertEqual(summary, "")
        
        
    }


    
}
