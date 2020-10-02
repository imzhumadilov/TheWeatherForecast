//
//  CitiesListViewController.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 26.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class CitiesListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Props
    var viewModel: CitiesListViewModel?
    var router: CitiesListRouterInput?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        bindViewModel()
        viewModel?.loadData()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        
        navigationItem.title = "Cities"
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightBarButtonTapped))
        navigationItem.setRightBarButton(rightBarButton, animated: true)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CityTableViewCell.id, bundle: nil),
                           forCellReuseIdentifier: CityTableViewCell.id)
    }
}

// MARK: - Actions
extension CitiesListViewController {
    
    @objc
    func rightBarButtonTapped() {
        router?.pushChooseCityViewController()
    }
}

// MARK: - Module functions
extension CitiesListViewController {
    
    private func bindViewModel() {
        
        viewModel?.loadDataCompletion = { [weak self] result in
            
            switch result {
                
            case .success:
                self?.tableView.reloadData()
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension CitiesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let addressList = viewModel?.addressList else { return 0 }
        
        return addressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: CityTableViewCell.id,
                                     for: indexPath) as? CityTableViewCell,
              let addressList = viewModel?.addressList else { return UITableViewCell() }
        
        cell.setup(title: addressList[indexPath.row].displayTitle)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let addressList = viewModel?.addressList else { return }
        
        router?.presentShowWeatherViewController(address: addressList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let addressList = viewModel?.addressList else { return }
        
        if editingStyle == .delete {
            viewModel?.removeAddress(addressList[indexPath.row])
        }
    }
}
