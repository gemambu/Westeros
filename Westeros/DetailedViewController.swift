//
//  DetailedViewController.swift
//  Westeros
//
//  Created by Gema on 3/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func manageSplitButton(){
        
        if UIDevice.current.userInterfaceIdiom.rawValue == 1 {
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
