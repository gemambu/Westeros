//
//  ArrayDataSourceTests.swift
//  Westeros
//
//  Created by Gema on 19/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros
class ArrayDataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    // revisar bien esto!!!
    func testArrayDataSourceCreation(){
        
        let dataSource = ArrayDataSource(model: [1,2,3,4]) { (number: Int,
            tableView: UITableView) -> UITableViewCell in
            
            let cellID = "testCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = "En numero \(number)"
            return cell!
        }
        
        XCTAssertNotNil(dataSource)
    }
    

    
}
