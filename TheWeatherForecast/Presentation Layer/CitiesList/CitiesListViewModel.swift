//
//  CitiesListViewModel.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 26.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CitiesListViewModelInput {
    func configure(with data: Any?)
}

class CitiesListViewModel {

    // MARK: - Props
    
    // MARK: - Initialization
    init() { }

    // MARK: - Public functions

}

// MARK: - Module functions
extension CitiesListViewModel { }

// MARK: - CitiesListViewModelInput
extension CitiesListViewModel: CitiesListViewModelInput {

    func configure(with data: Any?) { }

}
