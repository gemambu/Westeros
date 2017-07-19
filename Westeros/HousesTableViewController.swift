//
//  HousesTableViewController.swift
//  Westeros
//
//  Created by Gema on 18/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class HousesTableViewController: UITableViewController {
        
    let model : [House]
    
    init(model: [House]){
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        title = "Westeros"
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
        
        // obtenemos la casa seleccionada
        let houseVC = HouseViewController(model: model[indexPath.row])
        
        // mostramos la casa
        navigationController?.pushViewController(houseVC, animated: true)
        
    }
}
