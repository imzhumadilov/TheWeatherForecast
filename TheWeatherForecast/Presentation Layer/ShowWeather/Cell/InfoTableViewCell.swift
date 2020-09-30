//
//  InfoTableViewCell.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 30.09.2020.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var column1: UILabel!
    @IBOutlet private weak var column2: UILabel!
    @IBOutlet private weak var column3: UILabel!
    
    // MARK: - Props
    static let id = String(describing: InfoTableViewCell.self)
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        column1.text = ""
        column2.text = ""
        column3.text = ""
    }
    
    // MARK: - Setup function
    public func setup(cityName: String) {
        column1.text = cityName
        column2.text = cityName
        column3.text = cityName
    }
}
