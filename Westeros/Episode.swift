//
//  Episode.swift
//  Westeros
//
//  Created by Gema on 23/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class Episode {
    
    typealias Persons = Set<Person>
    
    let number: Int
    let title: String
    let summary: String

    private var _characters: Persons
    
    init(number: Int, title: String, summary: String){
        (self.number, self.title, self.summary) = (number, title, summary)
        _characters = Persons()
    }
}

extension Episode {
    var count : Int {
        return _characters.count
    }
    
    func addMember(person : Person) {
        guard !_characters.contains(person) else {
            return
        }
        _characters.insert(person)
    }
    
    // variadic version
    func addMember(persons: Person...){
        for person in persons{
            addMember(person: person)
        }
    }
    
    // Sorted [Person]
    func sortedMembers() -> [Person]{
        let memberArray : [Person] = Array(_characters)
        return memberArray.sorted()
    }
}

extension Episode {
    var proxyForEquatable : String {
        return "\(number) \(title)"
    }
    
    var proxyForComparison : Int{
        return number
    }
}

extension Episode : Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquatable == rhs.proxyForEquatable
    }
}

extension Episode : Hashable{
    var hashValue: Int {
        get {
            return proxyForEquatable.hashValue
        }
    }
}

extension Episode : Comparable{
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    static func >(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison > rhs.proxyForComparison
    }

}
