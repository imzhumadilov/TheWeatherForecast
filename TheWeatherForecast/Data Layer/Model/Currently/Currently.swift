//
//  Currently.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 05.10.2020.
//

import Foundation

struct Currently {
    let temperature: Double
    let apparentTemperature: Double
    let humidity: Double
    let pressure: Double
    let windSpeed: Double
    let visibility: Double
    let icon: String
    
    var temperatureString: String {
        return "\(Int(5 / 9 * (temperature - 32)))˚C"
    }
    var apparentTemperatureString: String {
        return "\(Int(5 / 9 * (apparentTemperature - 32)))˚C"
    }
    var humidityString: String {
        return "\(Int(humidity * 100)) %"
    }
    var pressureString: String {
        return "\(Int(pressure * 0.750062)) mm"
    }
    var windSpeedString: String {
        return "\(Int(windSpeed)) m/s"
    }
    var visibilityString: String {
        return "\(Int(visibility)) km"
    }
    
    init() {
        temperature = 0
        apparentTemperature = 0
        humidity = 0
        pressure = 0
        windSpeed = 0
        visibility = 0
        icon = ""
    }
    
    init(temperature: Double,
         apparentTemperature: Double,
         humidity: Double,
         pressure: Double,
         windSpeed: Double,
         visibility: Double,
         icon: String) {
        
        self.temperature = temperature
        self.apparentTemperature = apparentTemperature
        self.humidity = humidity
        self.pressure = pressure
        self.windSpeed = windSpeed
        self.visibility = visibility
        self.icon = icon
    }
}
