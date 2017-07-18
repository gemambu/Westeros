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

    
    var houses : [House] {get}
    func findHouse(name: String)->House?
    func houses(filteredBy: Filter)->[House]
    func findPerson(personName: String)->Person?
}

final class LocalFactory : HouseFactory {
    
    var houses: [House] {
        get {
            // aquí es donde te creas tus casas
            
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
        
        // How to fix this??
//        return Repository.local.houses.filter {
//            $0.getMembers().filter{
//                $0.name.uppercased() == personName.uppercased()
//            }.first
//        }
        
        
        for house in houses {
            person = house.findPerson(name: personName)
            if (person != nil){
                break
            }
        }
        
        return person
    }
    
}
