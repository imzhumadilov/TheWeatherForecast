//
//  UIViewController+identifier.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 26.09.2020.
//

import UIKit

extension UIViewController {
    
    public class var identifier: String {
        return String.className(self)
    }
}
