//
//  CitiesListViewModel.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 26.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CitiesListViewModelInput {
    func configure(with data: Any?)
}

class CitiesListViewModel {

    // MARK: - Props
    var loadDataCompletion: ((Result<[Address], Error>) -> Void)?
    var addressService: AddressService?
    
    // MARK: - Public functions
    public func loadData() {

        addressService?.loadData { [weak self] result in
            
            switch result {
            
            case .success(let addressList):
                self?.loadDataCompletion?(.success(addressList.map({ Address(from: $0) })))
                
            case .failure(let error):
                self?.loadDataCompletion?(.failure(error))
            }
        }
    }
}

// MARK: - Module functions
extension CitiesListViewModel { }

// MARK: - CitiesListViewModelInput
extension CitiesListViewModel: CitiesListViewModelInput {

    func configure(with data: Any?) { }

}

// MARK: - ChooseCityViewModelDelegate
extension CitiesListViewModel: ChooseCityViewModelDelegate {
    
    func addAddress(_ address: Address, completion: @escaping (Error?) -> (Void)) {
        addressService?.saveData(address) { [weak self] (result) in
            
            switch result {
            case .success:
                self?.loadData()
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
