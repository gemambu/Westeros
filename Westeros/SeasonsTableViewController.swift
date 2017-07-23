//
//  SeasonsTableViewController.swift
//  Westeros
//
//  Created by Gema on 23/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class SeasonsTableViewController: UITableViewController {
        
    
    let model : [Season]
    
    init(model: [Season]){
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        title = "Seasons"
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
        
        let cellID = "SeasonCell"
        
        // descubrir cual es la casa que tenemos que mostrar
        let season = model[indexPath.row]
        
        // crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            // creamos la celda
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // sincronizar season -> Cell
        cell?.textLabel?.text = "Season \(season.number)"
        
        return cell!
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // obtenemos la casa seleccionada
        let seasonVC = SeasonViewController(model: model[indexPath.row])
        
        // mostramos la casa
        navigationController?.pushViewController(seasonVC, animated: true)
        
    }
}
