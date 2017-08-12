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
    @IBOutlet weak var wikiButton: UIButton!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        setupSummaryView(summaryField: self.summaryField)
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
        
        
        let rightButton : UIBarButtonItem = persons
        navigationItem.rightBarButtonItem = rightButton
        
        self.wikiButton.addTarget(self, action:  #selector(displayWiki), for:.touchDown)
        self.wikiButton.titleLabel?.textColor = UIColor.red
        
    }
    
    func syncViewWithModel(){
        // model -> View
        titleLabel.text = "\(self.model.number) - \(model.title)"
        summaryField.text = model.summary
        airDateField.text = "Air date: " + DateFormatter.dateToString(date: model.airDate)
    }
    
    
    @objc func displayWiki(){
        
        // Creamos un WikiVC
        let wikiVC = WikiViewController(titleView: model.title, wikiURL: model.wikiURL)
        
        // lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    @objc func displayPersons(){
        
        let person = model.sortedMembers()
        let dataSource = DataSources.personsDataSource(model: person)
        let personsDelegate = PersonsDelegate(model: person.first!)
        let personsVC = ArrayTableViewController(dataSource: dataSource,
                                                 delegate: personsDelegate,
                                                 title: "Persons",
                                                 style: .plain).wrappedInNavigation()
        
        navigationController?.pushViewController(personsVC.viewControllers.first!, animated: true)
    }
    
}
