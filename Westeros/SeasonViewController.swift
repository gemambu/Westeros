//
//  SeasonViewController.swift
//  Westeros
//
//  Created by Gema on 23/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class SeasonViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var sesionNumberLabel: UILabel!
    @IBOutlet weak var initDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    var model : Season
    
    init(model: Season){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Season detail"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    func syncViewWithModel(){
        sesionNumberLabel.text = "Season number: \(self.model.number)"
        initDateLabel.text = DateFormatter.dateToString(date: self.model.initDate)
        endDateLabel.text = DateFormatter.dateToString(date: self.model.finalDate)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncViewWithModel()
    }


    func setupUI(){
        // Creamos el boton para los capítulos
        let episodes = UIBarButtonItem(title: "Episodes",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayEpisodes))
        

        
        let rightButton : UIBarButtonItem = episodes
        navigationItem.rightBarButtonItem = rightButton
        
    }

    @objc func displayEpisodes(){
        let episodesVC = EpisodesTableViewController(model: model.sortedEpisodes(), season: model.number)
        
        navigationController?.pushViewController(episodesVC, animated: true)
        
    }
 

}

extension SeasonViewController:  SeasonsControllerDelegate {
    func seasonsViewController(vc: SeasonsTableViewController, didSelectSeason season: Season){
        model = season
        
        //Sincronizamos vista y model
        viewWillAppear(true)
        
        syncViewWithModel()
        
        
    }
}
