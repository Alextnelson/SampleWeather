//
//  APIKeys.swift
//  SampleWeather
//
//  Created by Alexander Nelson on 3/16/16.
//  Copyright © 2016 Alexander Nelson. All rights reserved.
//

import Foundation

func valueForAPIKey(keyname: String) -> String {

    let filePath = NSBundle.mainBundle().pathForResource("Keys", ofType:"plist")
    let plist = NSDictionary(contentsOfFile:filePath!)
    
    let value:String = (plist?.objectForKey(keyname) as? String)!
    return value
}
