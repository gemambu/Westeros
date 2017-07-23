//
//  Delegates.swift
//  Westeros
//
//  Created by Gema on 20/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit
final class Delegates {
    static func housesDelegate(model: [House]) -> ArrayTableViewDelegate<House> {
        
        return ArrayTableViewDelegate(model: model, selectRow: { (house: House, tableView: UITableView, navigationController: UINavigationController?) in
            
            // La mostramos
            let houseVC = HouseViewController(model: house)
            navigationController?.pushViewController(houseVC, animated: true)
            
        })
        
    }
    
//    static func personsDelegate(model: [Person]) -> ArrayTableViewDelegate<Person> {
//        
//        return ArrayTableViewDelegate(model: model, selectRow: { (person: Person, tableView: UITableView, navigationController: UINavigationController?) in
//            
//            // La mostramos
//            let personVC = PersonsViewController(model: person)
//            navigationController?.pushViewController(personVC, animated: true)
//            
//        })
//        
//    }
}
