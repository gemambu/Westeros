//
//  Season.swift
//  Westeros
//
//  Created by Gema on 23/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class Season {
    
    typealias Episodes = Set<Episode>
    
    let number: Int
    let initDate: String
    let finalDate: String
    private var _episodes: Episodes
    
    init(number: Int, initDate: String, finalDate: String){
        (self.number, self.initDate, self.finalDate) = (number, initDate, finalDate)
        _episodes = Episodes()
    }
}

extension Season {
    var proxyForEquatable : String {
        return "\(number) \(initDate) \(finalDate)"
    }
    
    var proxyForComparison : Int {
        return number
    }
}

extension Season {
    var count : Int {
        return _episodes.count
    }
    
    func addEpisode(episode: Episode) {
        guard !_episodes.contains(episode) else {
            return
        }
        _episodes.insert(episode)
    }
    
    // variadic version
    func addEpisode(episodes: Episode...){
        for episode in episodes{
            addEpisode(episode: episode)
        }
    }
    
    // Sorted [Episode]
    func sortedEpisodes() -> [Episode]{
        let episodesArray : [Episode] = Array(_episodes)
        return episodesArray.sorted()
    }
    
}

extension Season {
    func findEpisode(title: String) -> Episode!{
        return _episodes.filter{ $0.title.uppercased() == title.uppercased() }.first
    }
}

extension Season: Equatable{
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquatable == rhs.proxyForEquatable
    }
}

extension Season: Hashable{
    var hashValue: Int {
        get {
            return proxyForEquatable.hashValue
        }
    }
}

extension Season: Comparable{
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    static func >(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison > rhs.proxyForComparison
    }
}



