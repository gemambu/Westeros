//
//  PersonViewController.swift
//  Westeros
//
//  Created by Gema on 23/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!   
    @IBOutlet weak var aliasLabel: UILabel!
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImage: UIImageView!
    
    let model : Person
    
    init(model: Person){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = self.model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        self.nameLabel.text = model.name
        self.fullNameLabel.text = model.fullName
        self.aliasLabel.text = model.alias
        self.houseNameLabel.text = model.house.name
        self.sigilImage.image = model.house.sigil.image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncViewWithModel()
    }
    
}
