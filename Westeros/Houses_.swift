//
//  Houses.swift
//  Westeros
//
//  Created by Gema on 9/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

typealias HouseList = Set<House>

final class Houses {
    
    private var _houses : HouseList
    
    init(){
        _houses = HouseList()
    }
    
}

extension Houses {
    var count : Int {
        return _houses.count
    }

    func addHouse(house : House) {

        var exists : Bool = false
        
        for savedHouse in self._houses {
            guard savedHouse.proxyForEquality != house.proxyForEquality else {
                exists = true
                break
            }
        }
        
        if(!exists){
            _houses.insert(house)
        }
    }
}

