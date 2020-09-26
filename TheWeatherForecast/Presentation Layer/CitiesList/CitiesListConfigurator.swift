//
//  CitiesListConfigurator.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 26.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

enum CitiesListConfigurator {
    
    static func create() -> CitiesListViewController {
        return CitiesListViewController(nibName: CitiesListViewController.identifier, bundle: nil)
    }
    
    @discardableResult
    static func configure(with reference: CitiesListViewController) -> CitiesListViewModelInput {
        let viewModel = CitiesListViewModel()
        
        let router = CitiesListRouter()
        router.viewController = reference
        
        reference.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
}
