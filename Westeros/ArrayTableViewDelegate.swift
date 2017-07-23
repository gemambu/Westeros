//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Gema on 20/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class ArrayTableViewDelegate<Element>: NSObject, UITableViewDelegate{

    typealias Elements  = [Element]
    typealias SelectRow = (Element, UITableView, UINavigationController?) -> ()
    
    let model : Elements
    let _selectRow: SelectRow
    
     public var navigationController: UINavigationController?
    
    init(model : Elements, selectRow: @escaping SelectRow){
        self.model = model
        _selectRow = selectRow
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // obtenemos el elemento
        let element = self.model[indexPath.row]
        
        // pusheamos el elemento
        _selectRow(element, tableView, navigationController)
    }
}
