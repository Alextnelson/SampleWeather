//
//  CurrentWeather.swift
//  SampleWeather
//
//  Created by Alexander Nelson on 3/15/16.
//  Copyright © 2016 Alexander Nelson. All rights reserved.
//

import Foundation
import UIKit

enum Icon: String {
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"

    func importIconImage() -> UIImage {
        if let image = UIImage(named: self.rawValue) {
            return image
        } else {
            return UIImage(named: "default")!
        }
    }
}

struct CurrentWeather {
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    var icon: UIImage? = UIImage(named: "default")
    
    init(weatherDictionary: [String: AnyObject]) {
        temperature = weatherDictionary["temperature"] as? Int
        guard let humidityFloat = weatherDictionary["humidity"] as? Double, let precipProbFlot = weatherDictionary["precipProbability"] as? Double, let iconString = weatherDictionary["icon"] as? String, let weatherIcon: Icon = Icon(rawValue: iconString) else {
            humidity = nil
            precipProbability = nil
            summary = weatherDictionary["summary"] as? String
            icon = Icon(rawValue: "default")?.importIconImage()
            return
        }
        humidity = Int(humidityFloat * 100)
        precipProbability = Int(precipProbFlot * 100)
        summary = weatherDictionary["summary"] as? String
        icon = weatherIcon.importIconImage()
        }
    }


