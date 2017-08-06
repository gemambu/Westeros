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

    
func getSummary(number: Int, type: String)-> String{
    let json = getJSON(fileName: type) as! JSONArray
    
    let ep = json.filter { (jsonObj) -> Bool in
        return jsonObj["number"] as! String  == "\(number)"
    }
    return ep[0]["summary"] as! String
        
}

func getSummary(fullname: String, type: String)-> String{
    let json = getJSON(fileName: type) as! JSONArray
    
    let ep = json.filter { (jsonObj) -> Bool in
        return jsonObj["name"] as! String  == fullname
    }
    return ep[0]["summary"] as! String
    
}

func getJSON(fileName: String) -> Any{
        var json: JSONArray?

    
        do {
            if let file = Bundle.main.url(forResource: fileName, withExtension: "json") {
                let data = try Data(contentsOf: file)
                json = try (JSONSerialization.jsonObject(with: data, options: []) as! JSONArray)
                
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return json!
    }

