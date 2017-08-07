//
//  Delegates.swift
//  Westeros
//
//  Created by Gema on 20/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class BaseViewControllerDelegate<Element>: NSObject {
    var dataSource : ArrayDataSource<Element>?
    var viewController : UIViewController?
    var navVC : UINavigationController?
    
    func getNavVC()->UINavigationController{
        return navVC!
    }
}

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
        if (UIDevice.current.userInterfaceIdiom.rawValue == 0){
            navVC?.pushViewController(houseVC, animated: true)
        }else {
            //delegate?.housesViewController(vc: self, didSelectHouse: house)
            let navHouse = UINavigationController(rootViewController: houseVC)
            navVC?.showDetailViewController(navHouse, sender: self)
        }
    }
    
}

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
        
        
        let navVC = viewController?.navigationController
        if (UIDevice.current.userInterfaceIdiom.rawValue == 0){
            navVC?.pushViewController(seasonVC, animated: true)
        }else {
            //delegate?.housesViewController(vc: self, didSelectHouse: house)
            let navSeason = UINavigationController(rootViewController: seasonVC)
            navVC?.showDetailViewController(navSeason, sender: self)
        }
    }

}



