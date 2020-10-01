//
//  ChooseCityConfigurator.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 27.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

enum ChooseCityConfigurator {
    
    static func create() -> ChooseCityViewController {
        return ChooseCityViewController(nibName: ChooseCityViewController.identifier, bundle: nil)
    }
    
    @discardableResult
    static func configure(with reference: ChooseCityViewController) -> ChooseCityViewModelInput {
        let viewModel = ChooseCityViewModel()
        
        let router = ChooseCityRouter()
        router.viewController = reference
        
        reference.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
