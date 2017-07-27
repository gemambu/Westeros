//
//  Formatter.swift
//  Westeros
//
//  Created by Gema on 27/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static func formatDateTime(date: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.date(from: date)
    }
    
    static func formatDate(date: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.date(from: date)
    }

    
    static func dateToString(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        return dateFormatter.string(from: date)
    }
    
}
