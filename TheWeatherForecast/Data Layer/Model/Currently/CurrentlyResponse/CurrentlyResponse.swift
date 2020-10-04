//
//  CurrentlyResponse.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 05.10.2020.
//

import Foundation

struct CurrentlyResponse: Decodable {
    let temperature: Double?
    let apparentTemperature: Double?
    let humidity: Double?
    let pressure: Double?
    let windSpeed: Double?
    let visibility: Double?
    let icon: String?
    
    func defaultMapping() -> Currently {
        return Currently(temperature: temperature ?? 0,
                         apparentTemperature: apparentTemperature ?? 0,
                         humidity: humidity ?? 0,
                         pressure: pressure ?? 0,
                         windSpeed: windSpeed ?? 0,
                         visibility: visibility ?? 0,
                         icon: icon ?? "")
    }
}
