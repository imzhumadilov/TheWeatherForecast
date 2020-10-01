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
    
    // MARK: - Setup function
    public func setup(descr: String, data: String, addData: String) {
        column1.text = descr
        column2.text = data
        column3.text = addData
    }
}
