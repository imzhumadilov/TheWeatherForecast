//
//  AddressService.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 27.09.2020.
//

import CoreData

protocol DatabaseProtocol {

    associatedtype EntityType
    associatedtype EntityProperty

    func saveData(_ data: EntityProperty, completion: @escaping (Result<EntityType, Error>) -> Void)
    func loadData(completion: @escaping (Result<[EntityType], Error>) -> Void)
    func removeAllData(completion: @escaping (Error?) -> Void)
    func removeData(_ data: EntityType, completion: @escaping (Result<EntityType, Error>) -> Void)
}

class AddressService: DatabaseProtocol {
    
    // MARK: - typealias
    typealias EntityType = AddressData
    typealias EntityProperty = Address
    
    // MARK: - Property
    private let context: NSManagedObjectContext

    // MARK: - Initialization
    init(context: NSManagedObjectContext) {
        self.context = context
    }

    // MARK: - Public functions
    func saveData(_ data: Address, completion: @escaping (Result<AddressData, Error>) -> Void) {

        guard let entity = NSEntityDescription.entity(forEntityName: String(describing: AddressData.self),
                                                      in: context) else {
                completion(.failure(NSError(domain: "CoreData",
                                            code: 404,
                                            userInfo: [NSLocalizedDescriptionKey: "Cannot find entity"])))
                return
        }

        let addressObject = AddressData(entity: entity, insertInto: context)
        addressObject.city = data.city
        addressObject.country = data.country
        
        let coordinatesObject = CoordinatesData(context: context)
        coordinatesObject.latitude = data.coordinates.latitude
        coordinatesObject.longitude = data.coordinates.longitude
        addressObject.coordinates = coordinatesObject

        do {
            try context.save()
            completion(.success(addressObject))
        } catch let error as NSError {
            completion(.failure(error))
        }
    }

    func loadData(completion: @escaping (Result<[AddressData], Error>) -> Void) {

        let fetchRequest: NSFetchRequest<AddressData> = AddressData.fetchRequest()

        do {
            let addresses = try context.fetch(fetchRequest)
            completion(.success(addresses))
        } catch let error as NSError {
            completion(.failure(error))
        }
    }

    func removeAllData(completion: @escaping (Error?) -> Void) {

        loadData { result in

            switch result {
            case .success(let addresses):
                addresses.forEach {
                    self.context.delete($0)
                }

                do {
                    try self.context.save()
                    completion(nil)
                } catch let error as NSError {
                    completion(error)
                }

            case .failure(let error):
                completion(error)
            }
        }
    }

    func removeData(_ data: AddressData, completion: @escaping (Result<AddressData, Error>) -> Void) {

        context.delete(data)
        do {
            try context.save()
            completion(.success(data))
        } catch let error as NSError {
            completion(.failure(error))
        }
    }
}
