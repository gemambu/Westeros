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
    
    let delegate : SeasonsControllerDelegate?
    
    init(model: [Season], delegate: SeasonsControllerDelegate?){
        self.model = model
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        
        title = "Seasons"
    }
    
    convenience init(model: [Season]){
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
        
        delegate?.seasonsViewController(vc: self, didSelectSeason: model[indexPath.row])
        
        if (UIDevice.current.userInterfaceIdiom.rawValue == 0){
            
            let seasonVC = SeasonViewController(model: model[indexPath.row])
            navigationController?.pushViewController(seasonVC, animated: true)
        } 
    }
}

//MARK: - Protocols
protocol SeasonsControllerDelegate {
    func seasonsViewController(vc: SeasonsTableViewController, didSelectSeason season: Season)
}
