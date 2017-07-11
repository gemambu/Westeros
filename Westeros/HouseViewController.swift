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
        
        syncViewWithModel()
    }

}
