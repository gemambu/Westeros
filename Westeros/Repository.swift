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
}

final class LocalFactory : HouseFactory {
    
    
    
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
