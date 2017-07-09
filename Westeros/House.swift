//
//  House.swift
//  Westeros
//
//  Created by Gema on 6/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit


typealias Words = String // emblema
typealias Members = Set<Person>

// MARK: - Classes
final class House {
    let name : String
    let sigil : Sigil
    let words : Words
    private var _members : Members
    
    init(name: String, sigil: Sigil, words: Words){
      (self.name, self.sigil, self.words) = (name, sigil, words)
        _members = Members()
    }
}

extension House {
    var count : Int {
        return _members.count
    }
    
    func addPerson(person : Person) {
        guard person.house.name == name else {
            return
        }
        _members.insert(person)
       
    }
}

extension House {
    var proxy : String {
        return "\(name) \(sigil.proxy) \(words) "
    }
}

extension House : Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension House : Hashable {
    var hashValue: Int {
        get {
            let proxy = "\(name) \(sigil.proxy) \(words) "
            return proxy.hashValue
        }
    }
}

extension House : Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxy < rhs.proxy
    }
    
    static func >(lhs: House, rhs: House) -> Bool {
         return lhs.proxy > rhs.proxy
    }   
}

final class Sigil {
    let description : String
    let image       : UIImage
    
    init(description: String, image: UIImage){
        (self.description, self.image) = (description, image)
    }
}

extension Sigil {
    var proxy : String {
        return "\(description) \(image)"
    }
}
