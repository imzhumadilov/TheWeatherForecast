//
//  WeatherService.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 26.09.2020.
//

import Foundation

class WeatherService {
    
    let apiKey = "bd95b048200518fe5499f5f36a63bca4"
    
    func getData(coordinates: Coordinates, completion: @escaping (Swift.Result<WeatherData, Error>) -> (Void)) {
        
        guard let url = URL(string: Routing.Weather.forecast + "/\(apiKey)/\(coordinates.latitude),\(coordinates.longitude)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data,
                  let decodedData = self.dataDecoding(type: WeatherDataResponse.self, data: data) else { return }
            
            DispatchQueue.main.async {
                completion(.success(decodedData.defaultMapping()))
            }
            
        }.resume()
    }
    
    func dataDecoding <T: Decodable> (type: T.Type, data: Data?) -> T? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = data, let decodedData = try? decoder.decode(type, from: data) else { return nil }
        return decodedData
    }
}
