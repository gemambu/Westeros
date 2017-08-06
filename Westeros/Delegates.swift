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
}

final class HousesDelegate:BaseViewControllerDelegate<House>, UITableViewDelegate{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let house = dataSource?.element(atIndexPath: indexPath)
        let houseVC = HouseViewController(model: house!)
        
 
        let navVC = viewController?.navigationController
        if (UIDevice.current.userInterfaceIdiom.rawValue == 0){
            navVC?.pushViewController(houseVC, animated: true)
        }else {
            //delegate?.housesViewController(vc: self, didSelectHouse: house)
            let navHouse = UINavigationController(rootViewController: houseVC)
            navVC?.showDetailViewController(navHouse, sender: self)
        }
    }
    
    public func getNavVC() -> UINavigationController {
        return (viewController?.navigationController)!
    }
    
    
}

final class SeasonsDelegate:BaseViewControllerDelegate<Season>, UITableViewDelegate{
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
    
    public func getSeasonVC() -> UINavigationController {
        return (viewController?.navigationController)!
    }
    
    
}



