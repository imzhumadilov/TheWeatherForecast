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
    var addressList: [Address] = []
    private var sourceAddressList: [AddressData] = []
    
    // MARK: - Public functions
    public func loadData() {

        addressService?.loadData { [weak self] result in
            
            switch result {
            
            case .success(let addressList):
                self?.sourceAddressList = addressList
                self?.addressList = addressList.map({ Address(from: $0) })
                self?.loadDataCompletion?(.success(addressList.map({ Address(from: $0) })))
                
            case .failure(let error):
                self?.loadDataCompletion?(.failure(error))
            }
        }
    }
    
    public func removeAddress(_ address: Address) {
        
        guard let removedAddress = sourceAddressList.filter ({ $0.coordinates?.latitude == address.coordinates.latitude && $0.coordinates?.longitude == address.coordinates.longitude }).first else { return }
        
        addressService?.removeData(removedAddress, completion: { [weak self] _ in self?.loadData() })
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
