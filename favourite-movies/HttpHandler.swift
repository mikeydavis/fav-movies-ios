//
//  HttpHandler.swift
//  favourite-movies
//
//  Created by Mike Davis on 31/03/2018.
//  Copyright © 2018 Midax. All rights reserved.
//

import Foundation


class HTTPHandler{
    
    static func getJson(urlString: String, completionHandler: @escaping(Data?) -> (Void)){
        let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url =  URL(string: urlString!)
        
        print("url being used is \(url!)")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!){ data, response,error in
            
            if let data = data {
                let httpresponse = response as! HTTPURLResponse
                let statusCode = httpresponse.statusCode
                print("request completed with code \(statusCode)")
                if (statusCode == 200){
                    print("return to competion handler with the data")
                    
                    completionHandler(data as Data)
                }
            } else if let error = error {
                print("error making http request")
                print(error.localizedDescription)
                completionHandler(nil)
            }
        }
        task.resume()
    }
    
}
