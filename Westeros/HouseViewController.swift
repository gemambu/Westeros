//
//  HouseViewController.swift
//  Westeros
//
//  Created by Gema on 10/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController, UISplitViewControllerDelegate {
    
    @IBOutlet weak var houseNameView: UILabel!
    
    @IBOutlet weak var wordsView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    var model : House
    
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        // asignamos el titulo en el init para que se cargue al arrancar y no
        // cuando se pulse por primera vez
        title = "House " + self.model.name
        
    }
    
    // chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        // model -> View
        houseNameView.text = model.sigil.description
        sigilImageView.image = model.sigil.image
        wordsView.text = model.words
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        syncViewWithModel()
        manageSplitButton()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        manageSplitButton()
    }
    
    
    func setupUI(){
        // Creamos el boton para los personajes
        let persons = UIBarButtonItem(title: "Persons",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayPersons))
        
        // Creamos un boton a la barra del navigationController
        let wiki = UIBarButtonItem(title: "Wiki Info",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        
        
        let rightButtons : [UIBarButtonItem] = [wiki, persons]
        navigationItem.rightBarButtonItems = rightButtons
        
    }
    
    @objc func displayWiki(){
        
        // Creamos un WikiVC
        let wikiVC = WikiViewController(titleView: model.name, wikiURL: model.wikiURL)
        
        // lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC, animated: true)
        
    }
    
    @objc func displayPersons(){
        
        // Cargamos el ViewController genérico de Persons
        let persons = model.sortedMembers()
        let dataSource = DataSources.personsDataSource(model: persons)
        let personsDelegate = PersonsDelegate(model: persons.first!)
        let personsVC = ArrayTableViewController(dataSource: dataSource,
                                                 delegate: personsDelegate,
                                                 title: "Persons",
                                                 style: .plain).wrappedInNavigation()
        
        navigationController?.pushViewController(personsVC.viewControllers.first!, animated: true)
    }
    
}



