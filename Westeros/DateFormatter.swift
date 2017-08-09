//
//  Formatter.swift
//  Westeros
//
//  Created by Gema on 27/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    /**
     Método usado para obtener una fecha y hora a partir de una cadena de texto
     **/
    static func formatDateTime(date: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        return formatter.date(from: date)
    }
    
    /**
     Método usado para obtener una fecha a partir de una cadena de texto
     **/
    static func formatDate(date: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter.date(from: date)
    }

    /**
     Método usado para obtener una fecha en formato texto
     **/
    static func dateToString(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: date)
    }
    
}
