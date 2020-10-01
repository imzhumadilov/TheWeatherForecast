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
    @IBOutlet private weak var weatherImageView: UIImageView!
    
    // MARK: - Props
    var viewModel: ShowWeatherViewModel?
    var router: ShowWeatherRouterInput?
    private var weatherData: WeatherData?
    private var weatherDataType: WeatherDataType = .currently {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        bindViewModel()
        viewModel?.loadData()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: InfoTableViewCell.id, bundle: nil),
                           forCellReuseIdentifier: InfoTableViewCell.id)
    }
    
}

// MARK: - Actions
extension ShowWeatherViewController {
    
    @IBAction
    func closeButtonTapped(_ sender: UIButton) {
        router?.dismissVC()
    }
    
    @IBAction
    func segmentedControlTapped(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        
        case 0:
            weatherDataType = .currently
            
        case 1:
            weatherDataType = .daily
            
        default:
            break
        }
    }
}

// MARK: - Module functions
extension ShowWeatherViewController {
    
    private func bindViewModel() {
        
        viewModel?.loadDataCompletion = { [weak self] result in
            
            switch result {
                
            case .success(let data):
                self?.weatherData = data.weatherData
                self?.tableView.reloadData()
                self?.cityNameLabel.text = data.address.displayTitle
                self?.weatherImageView.image = UIImage(named: data.weatherData.currently.icon)
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ShowWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let weatherData = weatherData else { return 0 }
        
        if weatherDataType == .currently {
            return 6
        }
        
        return weatherData.daily.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: InfoTableViewCell.id,
                                     for: indexPath) as? InfoTableViewCell,
              let weatherData = weatherData else { return UITableViewCell() }
        
        if weatherDataType == .currently {
            
            switch indexPath.row {
            
            case 0:
                cell.setup(descr: "Temperature", data: "", addData: weatherData.currently.temperatureString)
                
            case 1:
                cell.setup(descr: "Feels like", data: "", addData: weatherData.currently.apparentTemperatureString)
                
            case 2:
                cell.setup(descr: "Humidity", data: "", addData: weatherData.currently.humidityString)
                
            case 3:
                cell.setup(descr: "Pressure", data: "", addData: weatherData.currently.pressureString)
                
            case 4:
                cell.setup(descr: "Wind speed", data: "", addData: weatherData.currently.windSpeedString)
                
            case 5:
                cell.setup(descr: "Visibility", data: "", addData: weatherData.currently.visibilityString)
                
            default:
                break
            }
            
        } else if weatherDataType == .daily {
            
            cell.setup(descr: weatherData.daily.data[indexPath.row].timeString,
                       data: weatherData.daily.data[indexPath.row].temperatureMinString,
                       addData: weatherData.daily.data[indexPath.row].temperatureMaxString)
        }
        
        return cell
    }
}
