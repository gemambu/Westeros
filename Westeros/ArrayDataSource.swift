//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Gema on 19/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class ArrayDataSource<Element> : NSObject, UITableViewDataSource{
    
    typealias Elements = [Element]
    typealias CellMaker = (Element, UITableView)->UITableViewCell
    
    private let _model : Elements
    private let _cellMaker : CellMaker
    
    
    //@escaping se pone para la clausura que puede ser reutilizada
    init(model: Elements, cellMaker: @escaping CellMaker){
        _model = model
        _cellMaker = cellMaker
        
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    // Revisar bien esto para entenderlo!!!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elt = _model[indexPath.row]
        return _cellMaker(elt, tableView)
    }

    
}
