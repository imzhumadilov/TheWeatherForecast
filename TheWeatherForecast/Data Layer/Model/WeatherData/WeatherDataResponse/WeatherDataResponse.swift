//
//  WeatherDataResponse.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 05.10.2020.
//

import Foundation

struct WeatherDataResponse: Decodable {
    let currently: CurrentlyResponse?
    let daily: DailyResponse?
    
    func defaultMapping() -> WeatherData {
        return WeatherData(currently: currently?.defaultMapping() ?? Currently(),
                           daily: daily?.defaultMapping() ?? Daily())
    }
}
