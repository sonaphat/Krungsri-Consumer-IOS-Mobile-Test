//
//  WeaterModel.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//

import Foundation
import ObjectMapper

class Weathers: Mappable {
    var main: String = ""
    var description: String = ""
    var icon: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
}
