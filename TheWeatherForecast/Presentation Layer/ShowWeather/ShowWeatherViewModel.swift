//
//  ShowWeatherViewModel.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 30.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ShowWeatherViewModelInput {
    func configure(with data: Any?)
}

class ShowWeatherViewModel {

    // MARK: - Props

    // MARK: - Initialization
    init() { }

    // MARK: - Public functions

}

// MARK: - Module functions
extension ShowWeatherViewModel { }

// MARK: - ShowWeatherViewModelInput
extension ShowWeatherViewModel: ShowWeatherViewModelInput {

    func configure(with data: Any?) { }

}
