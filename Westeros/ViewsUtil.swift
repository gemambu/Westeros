//
//  ViewsUtil.swift
//  Westeros
//
//  Created by Gema on 7/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

/**
 Método usado para aplicar estilo al campo summary, común en tres vistas
 **/
func setupSummaryView(summaryField: UITextView){
    summaryField.layer.borderColor =  UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1).cgColor
    summaryField.layer.borderWidth = 1.0
    summaryField.layer.cornerRadius = 8
    summaryField.isEditable = false
    summaryField.isScrollEnabled = true
}

/**
 Método usado para aplicar estilo al TabBar
 **/
func setTabBarAppearance(){
    UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 15)!], for: .normal)
    UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
}
