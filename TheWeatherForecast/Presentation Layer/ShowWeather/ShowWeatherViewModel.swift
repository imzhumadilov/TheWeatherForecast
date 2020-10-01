//
//  ShowWeatherViewModel.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 30.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ShowWeatherViewModelInput {
    func configure(with address: Address)
}

class ShowWeatherViewModel {

    // MARK: - Props
    var loadDataCompletion: ((Result<(weatherData: WeatherData, address: Address), Error>) -> Void)?
    private var address: Address?
    private let weatherService = WeatherService()
    
    // MARK: - Public functions
    public func loadData() {
        
        guard let address = address else { return }
        
        weatherService.getData(coordinates: address.coordinates) { (result) -> (Void) in
            
            switch result {
            
            case .success(let weatherData):
                self.loadDataCompletion?(.success((weatherData, address)))
                
            case .failure(let error):
                self.loadDataCompletion?(.failure(error))
            }
        }
    }
}

// MARK: - Module functions
extension ShowWeatherViewModel { }

// MARK: - ShowWeatherViewModelInput
extension ShowWeatherViewModel: ShowWeatherViewModelInput {

    func configure(with address: Address) {
        self.address = address
    }
}
