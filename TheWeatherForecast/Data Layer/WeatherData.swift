//
//  WeatherData.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 01.10.2020.
//

import Foundation

enum WeatherDataType {
    case currently
    case daily
}

struct WeatherData {
    let currently: Currently
    let daily: Daily
}

struct WeatherDataResponse: Decodable {
    let currently: CurrentlyResponse?
    let daily: DailyResponse?
    
    func defaultMapping() -> WeatherData {
        return WeatherData(currently: currently?.defaultMapping() ?? Currently(),
                           daily: daily?.defaultMapping() ?? Daily())
    }
}

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

struct Daily {
    let data: [Day]
    
    init() {
        data = []
    }
    
    init(data: [Day]) {
        self.data = data
    }
}

struct DailyResponse: Decodable {
    let data: [DayResponse?]?
    
    func defaultMapping() -> Daily {
        return Daily(data: data?.compactMap({ $0?.defaultMapping() }) ?? [])
               
    }
}

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

struct DayResponse: Decodable {
    let time: Int?
    let temperatureMin: Double?
    let temperatureMax: Double?
    
    func defaultMapping() -> Day {
        return Day(time: time ?? 0,
                   temperatureMin: temperatureMin ?? 0,
                   temperatureMax: temperatureMax ?? 0)
    }
}
