//
//  Delegates.swift
//  Westeros
//
//  Created by Gema on 20/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

/*
 Clase Base Genérica para el Delegado
 */
class BaseViewControllerDelegate<Element>: NSObject {
    var dataSource : ArrayDataSource<Element>?
    var viewController : UIViewController?
    var navVC : UINavigationController?
    
    func getNavVC()->UINavigationController{
        return navVC!
    }
}

/*
 Delegado de Houses
 */
final class HousesDelegate:BaseViewControllerDelegate<House>, UITableViewDelegate{
    
    init(model: House){
        super.init()
        let initHouseVC = HouseViewController(model: model)
        navVC = UINavigationController()
        navVC?.pushViewController(initHouseVC, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let house = dataSource?.element(atIndexPath: indexPath)
        let houseVC = HouseViewController(model: house!)
        
 
        navVC = viewController?.navigationController
        
        // Si el dispositivo es ipad se creará un nuevo Navigation VC para incluir el VC del detalle
        // En cualquier otro caso, utilizaremos el NavigationVC ya existente
        if (UIDevice.current.userInterfaceIdiom ==  .pad){
            let navHouse = UINavigationController(rootViewController: houseVC)
            navVC?.showDetailViewController(navHouse, sender: self)
        } else {
            navVC?.pushViewController(houseVC, animated: true)
        }
    }
    
}

/*
 Delegado de Seasons
 */
final class SeasonsDelegate:BaseViewControllerDelegate<Season>, UITableViewDelegate{
    
    init(model: Season){
        super.init()
        let initSeasonVC = SeasonViewController(model: model)
        navVC = UINavigationController()
        navVC?.pushViewController(initSeasonVC, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let season = dataSource?.element(atIndexPath: indexPath)
        let seasonVC = SeasonViewController(model: season!)
        
        
        navVC = viewController?.navigationController
        
        // Si el dispositivo es ipad se creará un nuevo Navigation VC para incluir el VC del detalle
        // En cualquier otro caso, utilizaremos el NavigationVC ya existente
        if (UIDevice.current.userInterfaceIdiom == .pad){
            let navSeason = UINavigationController(rootViewController: seasonVC)
            navVC?.showDetailViewController(navSeason, sender: self)
        } else{
            navVC?.pushViewController(seasonVC, animated: true)

        }
    }

}

/*
 Delegado de Persons
 */
final class PersonsDelegate:BaseViewControllerDelegate<Person>, UITableViewDelegate{
    
    init(model: Person){
        super.init()
        let initVC = PersonViewController(model: model)
        navVC = UINavigationController()
        navVC?.pushViewController(initVC, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = dataSource?.element(atIndexPath: indexPath)
        let personVC = PersonViewController(model: person!)
        
        
        navVC = viewController?.navigationController
        
        // Si el dispositivo es ipad se creará un nuevo Navigation VC para incluir el VC del detalle
        // En cualquier otro caso, utilizaremos el NavigationVC ya existente
        if (UIDevice.current.userInterfaceIdiom ==  .pad){
            let navPerson = UINavigationController(rootViewController: personVC)
            navVC?.showDetailViewController(navPerson, sender: self)
        } else {
            navVC?.pushViewController(personVC, animated: true)
        }
    }
    
}

/*
 Delegado de Houses
 */
final class EpisodesDelegate:BaseViewControllerDelegate<Episode>, UITableViewDelegate{
    
    init(model: Episode){
        super.init()
        let initVC = EpisodeViewController(model: model)
        navVC = UINavigationController()
        navVC?.pushViewController(initVC, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = dataSource?.element(atIndexPath: indexPath)
        let episodeVC = EpisodeViewController(model: episode!)
        
        
        navVC = viewController?.navigationController
        
        // Si el dispositivo es ipad se creará un nuevo Navigation VC para incluir el VC del detalle
        // En cualquier otro caso, utilizaremos el NavigationVC ya existente
        if (UIDevice.current.userInterfaceIdiom == .pad){
            let navPerson = UINavigationController(rootViewController: episodeVC)
            navVC?.showDetailViewController(navPerson, sender: self)
        } else {
            navVC?.pushViewController(episodeVC, animated: true)
        }
    }
    
}



