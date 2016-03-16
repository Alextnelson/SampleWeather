//
//  NetworkOperation.swift
//  SampleWeather
//
//  Created by Alexander Nelson on 3/15/16.
//  Copyright © 2016 Alexander Nelson. All rights reserved.
//

import Foundation

class NetworkOperation {
    
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURL: NSURL
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]?) -> Void
    
    init(url: NSURL) {
        self.queryURL = url
    }
    
    func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
        let request: NSURLRequest = NSURLRequest(URL: queryURL)
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
        
        
        //1. Check HTTP response for successful GET request
            
            if let httpResponse = response as? NSHTTPURLResponse {
                
                switch(httpResponse.statusCode) {
                case 200:
                    do {
                        let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [String: AnyObject]
                        completion(jsonDictionary)
                    } catch {
                        print(error)
                    }
                default:
                    print("GET request not successful HTTP status code: \(httpResponse.statusCode)")
                }
               
                
            } else {
                print("Error, not a valid HTTP response")
            }
            
        }
        
        dataTask.resume()
    }
}
