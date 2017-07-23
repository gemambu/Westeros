//
//  PersonsViewController.swift
//  Westeros
//
//  Created by Gema on 19/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class PersonsViewController: UITableViewController {
        
    
    let model: [Person]
   
    init(model: [Person]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Persons"
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
        
        let cellID = "PersonCell"
        
        // descubrir cual es el personaje que tenemos que mostrar
        let person = model[indexPath.row]
        
        // crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            // creamos la celda
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // sincronizar House -> Cell
        cell?.textLabel?.text = person.fullName
        
        return cell!
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // obtenemos la casa seleccionada
       // let personVC = PersonViewController(model: model[indexPath.row])
        
        // mostramos la casa
        //navigationController?.pushViewController(personVC, animated: true)
        
    }

    
}
