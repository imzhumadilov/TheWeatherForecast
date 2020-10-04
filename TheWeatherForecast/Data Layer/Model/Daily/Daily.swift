//
//  Daily.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 05.10.2020.
//

import Foundation

struct Daily {
    let data: [Day]
    
    init() {
        data = []
    }
    
    init(data: [Day]) {
        self.data = data
    }
}
