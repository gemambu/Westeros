//
//  EpisodesTableViewController.swift
//  Westeros
//
//  Created by Gema on 23/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
        
    let model : [Episode]
    let season : Int
    
    init(model: [Episode], season: Int){
        self.model = model
        self.season = season
        
        super.init(nibName: nil, bundle: nil)
        
        title = "Episodes on season \(season)"
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
        
        let cellID = "EpisodeCell"
        
        // descubrir cual es la casa que tenemos que mostrar
        let episode = model[indexPath.row]
        
        // crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            // creamos la celda
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // sincronizar season -> Cell
        cell?.textLabel?.text = "\(episode.number) - " + episode.title
        
        return cell!
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // obtenemos la casa seleccionada
        let episodeVC = EpisodeViewController(model: model[indexPath.row])
        
        // mostramos la casa
        navigationController?.pushViewController(episodeVC, animated: true)
        
    }
}
