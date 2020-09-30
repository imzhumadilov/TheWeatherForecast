//
//  ChooseCityRouter.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 27.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ChooseCityRouterInput {
    func showAlert(title: String, message: String?)
    func presentShowWeatherViewController()
}

final class ChooseCityRouter: ChooseCityRouterInput {
    
    // MARK: - Props
    weak var viewController: ChooseCityViewController?
    
    // MARK: - ChooseCityRouterInput
    func showAlert(title: String, message: String?) {
        
        let alert = AlertController(title: title, message: message, preferredStyle: .alert)
        
        viewController?.present(alert, animated: true)
    }
    
    func presentShowWeatherViewController() {
        let showWeatherVC = ShowWeatherConfigurator.create()
        let viewModelInput = ShowWeatherConfigurator.configure(with: showWeatherVC)
        viewModelInput.configure(with: nil)
        
        showWeatherVC.modalPresentationStyle = .overFullScreen
        viewController?.present(showWeatherVC, animated: true)
    }
}
