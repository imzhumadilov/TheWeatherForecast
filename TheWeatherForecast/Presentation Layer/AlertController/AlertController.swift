//
//  AlertController.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 27.09.2020.
//

import UIKit

class AlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAction()
    }

    private func setupAction() {
        let ok = UIAlertAction(title: "OK", style: .default)
        addAction(ok)
    }
}
