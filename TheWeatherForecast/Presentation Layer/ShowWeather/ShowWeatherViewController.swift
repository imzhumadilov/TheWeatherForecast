//
//  ShowWeatherViewController.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 30.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ShowWeatherViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    // MARK: - Props
    var viewModel: ShowWeatherViewModel?
    var router: ShowWeatherRouterInput?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        setupActions()
    }
    
    override func viewDidLayoutSubviews() {
        applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() { }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    
}

// MARK: - Actions
extension ShowWeatherViewController {
    
    @IBAction
    func closeButtonTapped(_ sender: UIButton) {
        router?.dismissVC()
    }
}

// MARK: - Module functions
extension ShowWeatherViewController { }
