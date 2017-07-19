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
    let wikiURL: URL
    private var _members : Members
    
    init(name: String, sigil: Sigil, words: Words, url: URL){
      (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil, words, url)
        _members = Members()
    }
}

extension House {
    func findPerson(name: String) -> Person!{
        return _members.filter{ $0.name == name }.first
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
    
    // variadic version
    func addPerson(persons: Person...){
        for person in persons{
            addPerson(person: person)
        }
    }
    
    // Sorted [Person]
    func sortedMembers() -> [Person]{
        let memberArray : [Person] = Array(_members)
        return memberArray.sorted()
    }
}

extension House {
    var proxyForEquality : String {
        return "\(name) \(words) \(count)"
    }
    
    var proxyForComparison : String {
        get {
            return name.uppercased()
        }
    }
}

// MARK: - Equatable
extension House : Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension House : Hashable {
    var hashValue: Int {
        get {
            return proxyForEquality.hashValue
        }
    }
}

extension House : Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    static func >(lhs: House, rhs: House) -> Bool {
         return lhs.proxyForComparison > rhs.proxyForComparison
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
