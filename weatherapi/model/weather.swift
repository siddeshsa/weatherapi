//
//  weather.swift
//  weatherapi
//
//  Created by Siddesh A on 15/05/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}
struct Weather: Decodable {
    
    var temp:Double?
    var humidity:Double?
}
