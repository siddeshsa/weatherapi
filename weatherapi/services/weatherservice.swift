//
//  weatherservice.swift
//  weatherapi
//
//  Created by Siddesh A on 15/05/21.
//

import Foundation

class WeatherService{
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=738ff379e73e17b59fa0ca24e2c3f802")
            else {
                completion(nil)
                return
                }
        URLSession.shared.dataTask(with: url){
            data,response,error in
            guard let data = data, error == nil else {
                completion(nil)
                return
                
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse{
                let weather = weatherResponse.main
                completion(weather)
            }else{
                completion(nil)
            }
        }.resume()
        
        
    }
}
