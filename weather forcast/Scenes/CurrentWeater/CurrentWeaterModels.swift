//
//  CurrentWeaterModels.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

enum CurrentWeater {
    
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
    
    enum requestCurrentWeater {
        struct Request {
            let cityName: String
            let isMatric: Bool
        }
        struct Response {
            let current: CurrentWeaterModel?
        }
        
        struct ViewModel {
            let current: CurrentWeaterModel?
        }
    }
    
    enum requestForcastWeater {
        struct Request {
            let cityName: String
            let isMatric: Bool
        }
        struct Response {
            let current: MainForcastModel?
        }
        
        struct ViewModel {
            let list: [ForcastListModel]
        }
        
    }
}
