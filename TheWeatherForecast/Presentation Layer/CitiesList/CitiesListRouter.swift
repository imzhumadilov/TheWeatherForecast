//
//  CitiesListRouter.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 26.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CitiesListRouterInput {
    func pushChooseCityViewController()
}

final class CitiesListRouter: CitiesListRouterInput {
    
    // MARK: - Props
    weak var viewController: CitiesListViewController?
    
    // MARK: - CitiesListRouterInput
    func pushChooseCityViewController() {
        let chooseCityVC = ChooseCityConfigurator.create()
        let viewModelInput = ChooseCityConfigurator.configure(with: chooseCityVC)
        viewModelInput.configure(with: nil)
        
        viewController?.navigationController?.pushViewController(chooseCityVC, animated: true)
    }
}
