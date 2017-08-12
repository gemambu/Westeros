//
//  DataSources.swift
//  Westeros
//
//  Created by Gema on 20/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

/*
 DataSource específicos para cada modelo
 */
final class DataSources{
    
    /* DataSource para Houses */
    static func houseDataSource(model: [House])-> ArrayDataSource<House>{
        return ArrayDataSource(model: model, cellMaker: { (house: House, tableView: UITableView)
            -> UITableViewCell in
            
            let cellID = "House"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            
            return cell!
        })
    }
    
    /* DataSource para Persons */
    static func personsDataSource(model: [Person])-> ArrayDataSource<Person>{
        return ArrayDataSource(model: model, cellMaker: { (person: Person, tableView: UITableView)
            -> UITableViewCell in
            
            let cellID = "Person"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = person.fullName
            
            return cell!
        })
    }
    
    /* DataSource para Seasons */
    static func seasonDataSource(model: [Season])-> ArrayDataSource<Season>{
        return ArrayDataSource(model: model, cellMaker: { (season: Season, tableView: UITableView)
            -> UITableViewCell in
            
            let cellID = "Season"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = "Season \(season.number)"
            cell?.detailTextLabel?.text = "\(season.count) episodes"
            
            return cell!
        })
    }

    /* DataSource para Episodes */
    static func episodesDataSource(model: [Episode])-> ArrayDataSource<Episode>{
        return ArrayDataSource(model: model, cellMaker: { (episode: Episode, tableView: UITableView)
            -> UITableViewCell in
            
            let cellID = "Episode"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = "\(episode.number)" + " - " + episode.title
            
            return cell!
        })
    }
}
