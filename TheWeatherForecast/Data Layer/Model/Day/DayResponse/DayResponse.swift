//
//  DayResponse.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 05.10.2020.
//

import Foundation

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
