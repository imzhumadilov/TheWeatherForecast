//
//  Routing.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 04.10.2020.
//

import Foundation

enum Routing {
    
    enum UrlPaths {
        static let weatherServiceURL = "https://api.forecast.io"
    }
    
    enum Weather {
        static let forecast = Routing.UrlPaths.weatherServiceURL + "/forecast"
    }
}
