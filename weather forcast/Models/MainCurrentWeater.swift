//
//  MainCurrentWeater.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//

import Foundation
import ObjectMapper

class MainCurrentWeater: Mappable {
    var temp: Double = 0.0
    var feels_like: Double = 0.0
    var temp_min: Double = 0.0
    var temp_max: Double = 0.0
    var pressure: Double = 0.0
    var humidity: Double = 0.0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        temp <- map["temp"]
        feels_like <- map["feels_like"]
        temp_min <- map["temp_min"]
        temp_max <- map["temp_max"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        
    }
}
