//
//  CityTableViewCell.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 26.09.2020.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var cityLabel: UILabel!
    
    // MARK: - Props
    static let id = String(describing: CityTableViewCell.self)
    
    override func prepareForReuse() {
        cityLabel.text = ""
    }
    
    // MARK: - Setup function
    public func setup(cityName: String) {
        cityLabel.text = cityName
    }
}
