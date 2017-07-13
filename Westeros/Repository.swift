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
    var houses : [House] { get }
    func findHouse(name: String)->House!
    func findPerson(personName: String)->Person!
}

final class LocalFactory : HouseFactory {
    
    
    
    public func findHouse(name: String)->House! {
        let houseFound = self.houses.filter {$0.name == name}
        if(houseFound.count == 0){
            return nil
        }
        return houseFound.first!
    }
    
    public func findPerson(personName: String)->Person! {
        var person : Person!
        
        for house in houses {
            person = house.findPerson(name: personName)
            if (person != nil){
                return person
            }
        
        }
        
//        houses.map {
//            person = $0.findPerson(name: personName)
//            if (person != nil){
//                return person
//            }
//        }

        return nil
        
    }
    
    var houses: [House] {
        get {
            // aquí es donde te creas tus casas
            
            let starkImage = #imageLiteral(resourceName: "codeIsComing.png")
            let lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
            
            let starkSigil = Sigil(description: "Direwolf", image: starkImage)
            let lannisterSigil = Sigil (description: "Rampant Lion", image: lannisterImage)
            
            let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
            let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
            
            let ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
            let robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
            let arya = Person(name: "Arya", house: starkHouse)
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
            let cersei = Person(name: "Cersei", house: lannisterHouse)
            
            // añadir los personajes a las casas
            starkHouse.addPerson(person: ned)
            starkHouse.addPerson(person: robb)
            starkHouse.addPerson(person: arya)
            
            lannisterHouse.addPerson(person: tyrion)
            lannisterHouse.addPerson(person: cersei)
            
            return [starkHouse, lannisterHouse].sorted()

            
        }
    }

    
}
