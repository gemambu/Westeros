//
//  HousesTableViewController.swift
//  Westeros
//
//  Created by Gema on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class HousesTableViewController: UITableViewController {
        
    var model : [House]
    let delegate : HousesControllerDelegate?
    
    init(model: [House], delegate: HousesControllerDelegate?){
        self.model = model
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        
        title = "Houses"
    }
    
    convenience init(model: [House]){
        self.init(model: model, delegate: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "HouseCell"
        
        // descubrir cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        // crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            // creamos la celda
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // sincronizar House -> Cell
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let houseVC = HouseViewController(model: model[indexPath.row])
        
        if (UIDevice.current.userInterfaceIdiom.rawValue == 0){
            navigationController?.pushViewController(houseVC, animated: true)
        }else {
            delegate?.housesViewController(vc: self, didSelectHouse: model[indexPath.row])
            let navHouse = UINavigationController(rootViewController: houseVC)
            navigationController?.showDetailViewController(navHouse, sender: self)
        }
    }
}

//MARK: - Protocols
protocol HousesControllerDelegate {
    func housesViewController(vc: HousesTableViewController, didSelectHouse house: House)
}
