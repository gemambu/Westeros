//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by Gema on 23/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryField: UITextView!
    @IBOutlet weak var airDateField: UILabel!
    @IBOutlet weak var sesionLabel: UILabel!
    
    let model : Episode
    
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        // asignamos el titulo en el init para que se cargue al arrancar y no
        // cuando se pulse por primera vez
        title = "Episode \(self.model.number)"
        
        
        
    }
    
    // chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        // model -> View
        titleLabel.text = "\(self.model.number) - \(model.title)"
        summaryField.text = model.summary
        airDateField.text = "Air date: " + DateFormatter.dateToString(date: model.airDate)
        sesionLabel.text = "Season: \(model.season.number)"
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
        
        
        let rightButton : UIBarButtonItem = persons
        navigationItem.rightBarButtonItem = rightButton
        
    }
    
    @objc func displayPersons(){
        let personsVC = PersonsViewController(model: model.sortedMembers())
        
        navigationController?.pushViewController(personsVC, animated: true)
        
    }
    
}
