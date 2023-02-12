//
//  APIEndpoint.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//

import Foundation

public enum APIEndPoint {
    case getCurrentWeater(cityName: String, unit: unitType)
    case get5DaysForcast(cityName: String, unit: unitType)
    
    var path: String {
        switch self {
        case .get5DaysForcast(let cityName, let unit):
            return "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(APIKeyManager.shared.weaterAPIKey)&units=\(unit.rawValue)"
        case .getCurrentWeater(let cityName, let unit):
            return "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(APIKeyManager.shared.weaterAPIKey)&units=\(unit.rawValue)"
        }
    }
}

public enum unitType: String {
    case metric = "metric"
    case imperial = "imperial"
}
