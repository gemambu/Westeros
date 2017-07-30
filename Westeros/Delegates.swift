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
            
            let houseVC = HouseViewController(model: model.first!)
            ////navigationController = UINavigationController(rootViewController: houseVC)


            navigationController?.navigationController?.pushViewController(houseVC, animated: true)
            
        })
        
    }
    
    static func personsDelegate(model: [Person]) -> ArrayTableViewDelegate<Person> {
        
        return ArrayTableViewDelegate(model: model, selectRow: { (person: Person, tableView: UITableView, navigationController: UINavigationController?) in
            
            // La mostramos
            let personVC = PersonViewController(model: person)
            navigationController?.pushViewController(personVC, animated: true)
            
        })
        
    }
    
    static func seasonsDelegate(model: [Season]) -> ArrayTableViewDelegate<Season> {
        
        return ArrayTableViewDelegate(model: model, selectRow: { (season: Season, tableView: UITableView, navigationController: UINavigationController?) in
            
            // La mostramos
            let modelVC = SeasonViewController(model: season)
            navigationController?.pushViewController(modelVC, animated: true)
            
        })
        
    }
    
    static func episodesDelegate(model: [Episode]) -> ArrayTableViewDelegate<Episode> {
        
        return ArrayTableViewDelegate(model: model, selectRow: { (episode: Episode, tableView: UITableView, navigationController: UINavigationController?) in
            
            // La mostramos
            let modelVC = EpisodeViewController(model: episode)
            navigationController?.pushViewController(modelVC, animated: true)
            
        })
        
    }

}
