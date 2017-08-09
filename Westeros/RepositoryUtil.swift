//
//  RepositoryUtil.swift
//  Westeros
//
//  Created by Gema on 5/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation

typealias JSONObject = AnyObject
typealias JSONDictionary = [String: JSONObject]
typealias JSONArray = [JSONDictionary]


/**
 Método que obtiene el summary para un objeto definido en JSON por un número
 **/
func getSummary(number: Int, type: String)-> String{
    return getJsonObj(object: "\(number)", field: "number", type: type)
}

/**
 Método que obtiene el summary para un objeto definido en JSON por un nombre
 **/
func getSummary(fullname: String, type: String)-> String{
    return getJsonObj(object: fullname, field: "name", type: type)
}


/**
 Método genérico utilizado para devolver el objeto del json
 **/
func getJsonObj(object: String, field: String, type: String) -> String {
    let json = getJSON(fileName: type) as! JSONArray
    var summary: String = ""
    
    let ep = json.filter { (jsonObj) -> Bool in
        return jsonObj[field] as! String  == object
    }
    
    if ep.count > 0 {
        summary = ep[0]["summary"] as! String
    }
    
    return  summary
}


/**
 Método que obtiene el JSON completo
 **/
func getJSON(fileName: String) -> Any{
        var json: JSONArray = []

        do {
            if let file = Bundle.main.url(forResource: fileName, withExtension: "json") {
                let data = try Data(contentsOf: file)
                json = try (JSONSerialization.jsonObject(with: data, options: []) as! JSONArray)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return json
    }

