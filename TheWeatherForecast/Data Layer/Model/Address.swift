//
//  Address.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 30.09.2020.
//

import Foundation

struct Address {
    
    let city: String
    let country: String
    let coordinates: Coordinates
    
    init(city: String, country: String, coordinates: Coordinates) {
        self.city = city
        self.country = country
        self.coordinates = coordinates
    }
    
    init(from address: AddressData) {
        self.city = address.city ?? ""
        self.country = address.country ?? ""
        self.coordinates = Coordinates(latitude: 0, longitude: 0)
    }
}
