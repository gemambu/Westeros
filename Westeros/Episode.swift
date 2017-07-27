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
    let airDate: Date
    let summary: String
    let season: Season

    private var _characters: Persons
    
    init(number: Int, title: String, airDate: Date, summary: String, season: Season){
        (self.number, self.title, self.airDate, self.summary, self.season) = (number, title, airDate, summary, season)
        _characters = Persons()
        self.season.addEpisode(episode: self)
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
        let dateAir = DateFormatter.dateToString(date: airDate)
        return "\(number) \(title) \(dateAir)"
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
