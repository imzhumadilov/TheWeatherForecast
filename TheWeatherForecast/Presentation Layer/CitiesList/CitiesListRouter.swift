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
        ChooseCityConfigurator.configure(with: chooseCityVC)
        chooseCityVC.viewModel?.delegate = viewController?.viewModel
        
        viewController?.navigationController?.pushViewController(chooseCityVC, animated: true)
    }
}
