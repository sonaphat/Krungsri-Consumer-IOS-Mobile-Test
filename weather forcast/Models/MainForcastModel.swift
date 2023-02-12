//
//  MainForcastModel.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 13/2/2566 BE.
//

import Foundation
import ObjectMapper

class MainForcastModel: Mappable {

    var list: [ForcastListModel] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {

        list <- map["list"]
    }
}


