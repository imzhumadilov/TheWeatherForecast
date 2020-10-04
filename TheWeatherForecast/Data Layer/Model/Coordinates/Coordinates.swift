//
//  Coordinates.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 30.09.2020.
//

import Foundation

struct Coordinates {
    
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(from coordinates: CoordinatesData?) {
        self.latitude = coordinates?.latitude ?? 0
        self.longitude = coordinates?.longitude ?? 0
    }
}
