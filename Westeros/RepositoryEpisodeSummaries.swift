//
//  RepositoryEpisodeSummaries.swift
//  Westeros
//
//  Created by Gema on 3/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

extension Repository {

    
    func getSummary(episode: Int) -> String {
        var txt : String = ""
        do {
            if let file = Bundle.main.url(forResource: "EpisodeSummaries", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    
                    print(object)
                    txt = "dictionary"
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                    txt = "array"
                } else {
                    print("JSON is invalid")
                    txt = "invalid"
                }
            } else {
                print("no file")
                txt = "no file"
            }
        } catch {
            print(error.localizedDescription)
        }
        
    return txt
        
//        switch episode {
//        case 101:
//            return EPISODE_101
//        }
    }
}


