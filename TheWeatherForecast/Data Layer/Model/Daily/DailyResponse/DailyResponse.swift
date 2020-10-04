//
//  DailyResponse.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 05.10.2020.
//

import Foundation

struct DailyResponse: Decodable {
    let data: [DayResponse?]?
    
    func defaultMapping() -> Daily {
        return Daily(data: data?.compactMap({ $0?.defaultMapping() }) ?? [])
               
    }
}
