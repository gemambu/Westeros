//
//  DetailedViewController.swift
//  Westeros
//
//  Created by Gema on 3/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     Método auxiliar para manejar el botón de Split
     **/
    func manageSplitButton(){
        
        // Se manejará el botón para mostrar el listado en caso de ser iPad
        // y estar con orientacion Portrait
        if UIDevice.current.userInterfaceIdiom == .pad {
            if UIDevice.current.orientation.isPortrait == true {
                let listButton = UIBarButtonItem(title: "List",
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(displayList))
                navigationItem.leftBarButtonItem = listButton
            } else {
                navigationItem.leftBarButtonItem = nil
                self.splitViewController?.preferredDisplayMode = .automatic
            }
        }
        
    }
    
    @objc func displayList(){
        self.splitViewController?.preferredDisplayMode = .primaryOverlay
    }
    
    
}
