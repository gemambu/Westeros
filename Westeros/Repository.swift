//
//  Repository.swift
//  Westeros
//
//  Created by Gema on 11/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class Repository {
    
   
    static let local = LocalFactory()
}

protocol HouseFactory {
    typealias Filter = (House)->Bool
    typealias FilterSeason = (Season)->Bool
    
    typealias Episodes = [Episode]

    
    var houses : [House] {get}
    var seasons : [Season] {get}
    
    func findHouse(name: String)->House?
    func houses(filteredBy: Filter)->[House]
    func findPerson(personName: String)->Person?
    
    func findSeason(number: Int)->Season?
    func seasons(filteredBy: FilterSeason)->[Season]
    func findEpisode(episodeTitle: String)->Episode?
}

final class LocalFactory : HouseFactory {
    
    
// MARK: - houses
    var houses: [House] {
        get {
            
            let starkImage = #imageLiteral(resourceName: "codeIsComing.png")
            let lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
            let targaryenImage = #imageLiteral(resourceName: "targaryen.jpg")
            
            
            let starkSigil = Sigil(description: "Direwolf", image: starkImage)
            let lannisterSigil = Sigil(description: "Rampant Lion", image: lannisterImage)
            let targaryenSigil = Sigil(description: "Red three-headed dragon,", image: targaryenImage)
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkURL)
            
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/Lannister")!
            let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: lannisterURL)
            
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire and blood", url: targaryenURL)
            
            let ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
            let robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
            let arya = Person(name: "Arya", house: starkHouse)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
            let cersei = Person(name: "Cersei", house: lannisterHouse)
            let jaime = Person(name: "Jaime Lannister", alias: "Kingslayer", house: lannisterHouse)
            
            let daenerys = Person(name: "Daenerys", alias: "Mother of Dragons", house: targaryenHouse)
            let viserys = Person(name: "Viserys", alias: "The Young King" , house: targaryenHouse)
            let rhaegar = Person(name: "Rhaegar", alias: "The Last Dragon" , house: targaryenHouse)
            
            
            // añadir los personajes a las casas
            starkHouse.addPerson(persons: ned, robb, arya)
            
            lannisterHouse.addPerson(persons: tyrion, cersei, jaime)
            
            targaryenHouse.addPerson(persons: daenerys, viserys, rhaegar)

            return [starkHouse, lannisterHouse, targaryenHouse].sorted()

        }
        
    }

    public func findHouse(name: String)->House? {
        let houseFound = houses.filter {$0.name.uppercased() == name.uppercased()}.first
        return houseFound
    }
    
    func houses(filteredBy: (House) -> Bool) -> [House] {
        let filtered = houses.filter(filteredBy)
        return filtered
    }
    
    public func findPerson(personName: String)->Person? {
        var person: Person?
    
        
        for house in houses {
            person = house.findPerson(name: personName)
            if (person != nil){
                break
            }
        }
        
        return person
    }
    
    public func getAllPersons() -> [Person]{
        var personList : [Person] = []
        
        for house in houses {
            for person in house.sortedMembers(){
                personList.append(person)
            }
        }
        
        return personList
    }
    
    
// MARK: - Seasons
    
    var seasons: [Season] {
        get{
            
            
            let episode1x01 = Episode(number: 1, title: "Winter Is Coming", summary: "This is the first chapter ever on GOT on season 01")
            
            let episode1x02 = Episode(number: 2, title: "The Kingsroad", summary: "This is the second chapter  on GOT on season 01")
            let episode1x03 = Episode(number: 3, title: "Lord Snow", summary: "This is the third chapter ever on GOT on season 01")
            let episode1x04 = Episode(number: 4, title: "Cripples, Bastards, and Broken Things", summary: "This is the fourth chapter  on GOT on season 01")
            let episode1x05 = Episode(number: 5, title: "The Wolf and the Lion", summary: "This is the fifth chapter ever on GOT on season 01")
            let episode1x06 = Episode(number: 6, title: "A Golden Crown", summary: "This is the sixth chapter  on GOT on season 01")
            let episode1x07 = Episode(number: 7, title: "You Win or You Die", summary: "This is the seventh chapter ever on GOT on season 01")
            let episode1x08 = Episode(number: 8, title: "The Pointy End", summary: "This is the eighth chapter  on GOT on season 01")
            let episode1x09 = Episode(number: 9, title: "Baelor", summary: "This is the ninth chapter ever on GOT on season 01")
            let episode1x10 = Episode(number: 10, title: "Fire and Blood", summary: "This is the tenth chapter  on GOT on season 01")
            
            var episodesList = [episode1x01, episode1x02, episode1x03, episode1x04, episode1x05, episode1x06, episode1x07, episode1x08, episode1x09, episode1x10]
            
            addPersonsOnChapter(episodes: &episodesList)

            
            let season01 = Season(number: 1, initDate: "2011/04/17", finalDate: "2011/06/19")
            
            season01.addEpisode(episodes: episode1x01, episode1x02, episode1x03, episode1x04, episode1x05, episode1x06, episode1x07, episode1x08, episode1x09, episode1x10)
            
            let episode2x01 = Episode(number: 1, title: "The North Remembers", summary: "This is the first chapter ever on GOT on season 02")
            let episode2x02 = Episode(number: 2, title: "The Night Lands", summary: "This is the second chapter ever on GOT on season 02")
            let episode2x03 = Episode(number: 3, title: "What Is Dead May Never Die", summary: "This is the third chapter ever on GOT on season 02")
            let episode2x04 = Episode(number: 4, title: "Garden of Bones", summary: "This is the fourth chapter ever on GOT on season 02")
            let episode2x05 = Episode(number: 5, title: "The Ghost of Harrenhal", summary: "This is the fifth chapter ever on GOT on season 02")
            let episode2x06 = Episode(number: 6, title: "The Old Gods and the New", summary: "This is the sixth chapter ever on GOT on season 02")
            let episode2x07 = Episode(number: 7, title: "A Man Without Honor", summary: "This is the seventh chapter ever on GOT on season 02")
            let episode2x08 = Episode(number: 8, title: "The Prince of Winterfell", summary: "This is the eighth chapter ever on GOT on season 02")
            let episode2x09 = Episode(number: 9, title: "Blackwater", summary: "This is the nineth chapter ever on GOT on season 02")
            let episode2x10 = Episode(number: 10, title: "Valar Morghulis", summary: "This is the tenth chapter ever on GOT on season 02")
            
            let season02 = Season(number: 2, initDate: "2012/04/01", finalDate: "2012/06/03")
            
            season02.addEpisode(episodes: episode2x01, episode2x02, episode2x03, episode2x04, episode2x05, episode2x06, episode2x07, episode2x08, episode2x09, episode2x10)
            
            episodesList = [episode2x01, episode2x02, episode2x03, episode2x04, episode2x05, episode2x06, episode2x07, episode2x08, episode2x09, episode2x10]
            
            addPersonsOnChapter(episodes: &episodesList)
            
            let season03 = Season(number: 3, initDate: "2013/03/31", finalDate: "2013/06/09")
            let season04 = Season(number: 4, initDate: "2014/04/06", finalDate: "2014/06/15")
            let season05 = Season(number: 5, initDate: "2015/04/12", finalDate: "2014/06/14")
            let season06 = Season(number: 6, initDate: "2016/04/24", finalDate: "2015/06/26")
            let season07 = Season(number: 7, initDate: "2017/07/16", finalDate: "2012/08/27")

     
            return [season01, season02, season03, season04, season05, season06, season07].sorted()
        }
    }

    
    func findSeason(number: Int) -> Season? {
        let seasonFound = seasons.filter {$0.number == number}.first
        return seasonFound
    }
    

    
    func seasons(filteredBy: (Season) -> Bool) -> [Season] {
        let filtered = seasons.filter(filteredBy)
        return filtered

    }
    
    func findEpisode(episodeTitle: String) -> Episode? {
        var episode: Episode?
        
        for season in seasons {
            episode = season.findEpisode(title: episodeTitle)
            if (episode != nil){
                break
            }
        }
        
        return episode!
    }
    

    func addPersonsOnChapter(episodes: inout Episodes){
        let persons : [Person] = getAllPersons()
        
        for episode in episodes {
            for person in persons {
                episode.addMember(person: person)
            }
        }
        
    }

    
}
