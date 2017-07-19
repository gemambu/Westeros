//
//  HouseViewController.swift
//  Westeros
//
//  Created by Gema on 10/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    
    @IBOutlet weak var wordsView: UILabel!

    @IBOutlet weak var sigilImageView: UIImageView!
    
    let model : House
    
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        // asignamos el titulo en el init para que se cargue al arrancar y no
        // cuando se pulse por primera vez
        title = self.model.name

        
        
    }
    
    // chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    func syncViewWithModel(){
        // model -> View
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsView.text = model.words
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncViewWithModel()
    }
    
    func setupUI(){
        // Creamos el boton para los personajes
        let persons = UIBarButtonItem(title: "Persons",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayPersons))
        // Creamos un boton a la barra del navigationController
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        
        
        let rightButtons : [UIBarButtonItem] = [wiki, persons]
        navigationItem.rightBarButtonItems = rightButtons

    }
    
    @objc func displayWiki(){
        
        // Creamos un WikiVC 
        let wikiVC = WikiViewController(model: model)
        
        // lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC, animated: true)
        
    }
    
    @objc func displayPersons(){
        let personsVC = PersonsViewController(model: model.sortedMembers())
        
        navigationController?.pushViewController(personsVC, animated: true)
        
    }
    


}
