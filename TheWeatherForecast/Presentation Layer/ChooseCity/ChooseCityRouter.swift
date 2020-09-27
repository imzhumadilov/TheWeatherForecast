//
//  ChooseCityRouter.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 27.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ChooseCityRouterInput {
    func showAlert(title: String, message: String?)
}

final class ChooseCityRouter: ChooseCityRouterInput {
    
    // MARK: - Props
    weak var viewController: ChooseCityViewController?
    
    // MARK: - ChooseCityRouterInput
    func showAlert(title: String, message: String?) {
        
        let alert = AlertController(title: title, message: message, preferredStyle: .alert)
        
        viewController?.present(alert, animated: true)
    }
}
