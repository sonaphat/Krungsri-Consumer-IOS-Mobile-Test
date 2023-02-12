//
//  ForcastTableModels.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

enum ForcastTable {
    
    enum requestForcastWeater {
        struct Request {
        }
        struct Response {
            let list: [ForcastListModel]?
        }
        
        struct ViewModel {
            let list: [ForcastListModel]
        }
        
    }
    
    enum ErrorHandler {
        struct Request {
        }
        
        struct Response {
            let error: Error?
            let errorMessage: String
        }
        
        struct ViewModel {
            let errorTitleMessage: String
            let errorDescMessage: String
        }
    }
}
