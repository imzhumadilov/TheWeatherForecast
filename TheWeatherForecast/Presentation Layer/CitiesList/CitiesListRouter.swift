//
//  CitiesListRouter.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 26.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CitiesListRouterInput {
    func pushChooseCityViewController()
    func presentShowWeatherViewController(address: Address)
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
    
    func presentShowWeatherViewController(address: Address) {
        let showWeatherVC = ShowWeatherConfigurator.create()
        let viewModelInput = ShowWeatherConfigurator.configure(with: showWeatherVC)
        viewModelInput.configure(with: address)
        
        showWeatherVC.modalPresentationStyle = .overFullScreen
        viewController?.present(showWeatherVC, animated: true)
    }
}
