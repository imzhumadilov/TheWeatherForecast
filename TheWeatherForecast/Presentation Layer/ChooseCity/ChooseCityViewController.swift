//
//  ChooseCityViewController.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 27.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ChooseCityViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var areaLabel: UILabel!
    
    // MARK: - Props
    var viewModel: ChooseCityViewModel?
    var router: ChooseCityRouterInput?
    
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
    func setupComponents() {
        navigationItem.title = "Choose city"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    
    
}

// MARK: - Actions
extension ChooseCityViewController {
    
    @IBAction
    func myLocationButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction
    func showWeatherButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction
    func addButtonTapped(_ sender: UIButton) {
    }
}

// MARK: - Module functions
extension ChooseCityViewController { }
