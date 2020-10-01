//
//  CityTableViewCell.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 26.09.2020.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Props
    static let id = String(describing: CityTableViewCell.self)
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        titleLabel.text = ""
    }
    
    // MARK: - Setup function
    public func setup(title: String) {
        titleLabel.text = title
    }
}
