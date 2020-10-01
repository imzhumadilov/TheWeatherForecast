//
//  ChooseCityViewModel.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 27.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ChooseCityViewModelInput {
    func configure(with data: Any?)
}

protocol ChooseCityViewModelDelegate: class {
    func addAddress(_ address: Address, completion: @escaping (Error?) -> Void)
}

class ChooseCityViewModel {

    // MARK: - Props
    var address: Address?
    weak var delegate: ChooseCityViewModelDelegate?

    // MARK: - Public functions
    public func addAddress(completion: @escaping (Error?) -> Void) {
        
        guard let address = address else { return }
        
        delegate?.addAddress(address) { (error) in
            completion(error)
        }
    }
}

// MARK: - Module functions
extension ChooseCityViewModel { }

// MARK: - ChooseCityViewModelInput
extension ChooseCityViewModel: ChooseCityViewModelInput {

    func configure(with data: Any?) { }

}
