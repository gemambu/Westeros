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

    
   func getSummary(episode: Int)-> String{
        let json = getJSON() as! JSONArray
        
        let ep = json.filter { (jsonObj) -> Bool in
            return jsonObj["number"] as! String  == "\(episode)"
        }
        return ep[0]["summary"] as! String
        
    }
    
    func getJSON() -> Any{
        var json: JSONArray?
        do {
            if let file = Bundle.main.url(forResource: "EpisodeSummaries", withExtension: "json") {
                let data = try Data(contentsOf: file)
                json = try (JSONSerialization.jsonObject(with: data, options: []) as! JSONArray)
                
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return json!
    }

