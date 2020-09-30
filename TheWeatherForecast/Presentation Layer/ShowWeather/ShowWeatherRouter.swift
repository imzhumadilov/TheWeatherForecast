//
//  ShowWeatherRouter.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 30.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ShowWeatherRouterInput {
    func dismissVC()
}

final class ShowWeatherRouter: ShowWeatherRouterInput {
    
    // MARK: - Props
    weak var viewController: ShowWeatherViewController?
    
    // MARK: - ShowWeatherRouterInput
    func dismissVC() {
        viewController?.dismiss(animated: true)
    }
}
