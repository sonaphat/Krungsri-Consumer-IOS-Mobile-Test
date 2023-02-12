//
//  CurrentWeaterModel.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//

import Foundation
import ObjectMapper

class CurrentWeaterModel: Mappable {
    var main: MainCurrentWeater? = nil
    var weater: [Weathers] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        main <- map["main"]
        weater <- map["weather"]
    }
}
