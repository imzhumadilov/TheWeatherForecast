//
//  ShowWeatherConfigurator.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 30.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

enum ShowWeatherConfigurator {
    
    static func create() -> ShowWeatherViewController {
        return ShowWeatherViewController(nibName: ShowWeatherViewController.identifier, bundle: nil)
    }
    
    static func configure(with reference: ShowWeatherViewController) -> ShowWeatherViewModelInput {
        let viewModel = ShowWeatherViewModel()
        
        let router = ShowWeatherRouter()
        router.viewController = reference
        
        reference.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
