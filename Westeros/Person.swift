//
//  Character.swift
//  Westeros
//
//  Created by Gema on 6/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation

final class Person {
    let name: String
    let house : House
    // Variable de instancia
    private let _alias: String?
    
    
    
    // variable conmutada // también es una función
    var alias : String {
        get {
            return _alias ?? "" // dame _alias y si está vacio me devuelves lo segundo
        }
    }
    
    init(name: String, alias: String?, house: House){
        (self.name, _alias, self.house) = (name, alias, house)
    }
    
    convenience init(name: String, house: House) {
        self.init(name: name, alias: nil, house: house);
    }
}

extension Person {
    var fullName : String {
        return "\(name) \(house.name)"
    }
}
extension Person {
    var proxy : String {
        return "\(name) \(alias) \(house.name)"
    }
}
extension Person : Hashable {
    var hashValue: Int {
        get {
            let proxy = "\(name) \(alias) \(house.name)"
            return proxy.hashValue
        }
    }
}

extension Person : Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Person : Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
       return lhs.proxy < rhs.proxy
 
    }

    static func >(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy > rhs.proxy
    }
    
}
