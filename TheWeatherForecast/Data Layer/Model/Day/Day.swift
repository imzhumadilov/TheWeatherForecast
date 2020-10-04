//
//  Day.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 05.10.2020.
//

import Foundation

struct Day {
    let time: Int
    let temperatureMin: Double
    let temperatureMax: Double
    
    var timeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return "\(dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(time))))"
    }
    var temperatureMinString: String {
        return "\(Int(5 / 9 * (temperatureMin - 32)))˚C"
    }
    var temperatureMaxString: String {
        return "\(Int(5 / 9 * (temperatureMax - 32)))˚C"
    }
}
