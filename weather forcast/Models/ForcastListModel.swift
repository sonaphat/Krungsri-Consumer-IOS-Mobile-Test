//
//  ForcastListModel.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//

import Foundation
import ObjectMapper

class ForcastListModel: Mappable {
    
    var weater: [Weathers] = []
    var main: MainCurrentWeater? = nil
    var date: Double = 0.0
    
    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        weater <- map["weather"]
        main <- map["main"]
        date <- map["dt"]
    }
    
}
