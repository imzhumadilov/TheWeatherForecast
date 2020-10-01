//
//  ChooseCityViewModel.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 27.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ChooseCityViewModelInput {
    func configure(with data: Any?)
}

class ChooseCityViewModel {

    // MARK: - Props
    var address: Address?

    // MARK: - Public functions
    
}

// MARK: - Module functions
extension ChooseCityViewModel { }

// MARK: - ChooseCityViewModelInput
extension ChooseCityViewModel: ChooseCityViewModelInput {

    func configure(with data: Any?) { }

}
