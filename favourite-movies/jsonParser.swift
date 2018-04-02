//
//  jsonParser.swift
//  favourite-movies
//
//  Created by Mike Davis on 01/04/2018.
//  Copyright © 2018 Midax. All rights reserved.
//

import Foundation

class JSONParser {
    
    static func parse (data: Data) -> [String: AnyObject]? {
        let options = JSONSerialization.ReadingOptions()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: options)
            as? [String: AnyObject]
            
            return json!
        } catch(let parserError){
            print(" There was an error parsing json \(parserError.localizedDescription)")
        }
        return nil
    }
    
}
