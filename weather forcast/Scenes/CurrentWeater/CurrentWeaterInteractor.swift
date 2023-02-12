//
//  CurrentWeaterInteractor.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol CurrentWeaterBusinessLogic {
    func requestCurrentWeather(request: CurrentWeater.requestCurrentWeater.Request)
    func requestForcastWeather(request: CurrentWeater.requestForcastWeater.Request)
}

protocol CurrentWeaterDataStore {
}

class CurrentWeaterInteractor: CurrentWeaterDataStore {
    var presenter: CurrentWeaterPresentationLogic?

}

extension CurrentWeaterInteractor: CurrentWeaterBusinessLogic {
    func requestCurrentWeather(request: CurrentWeater.requestCurrentWeater.Request) {
        
        let config = RequestConfigs(urlString: APIEndPoint.getCurrentWeater(cityName: request.cityName,
                                                                            unit: request.isMatric ? .metric : .imperial).path,
                                    method: .get)
        BaseServiceRequester.shared.callRequest(config: config) { (currentWeather: CurrentWeaterModel) in
            print(currentWeather)
            if let _ = currentWeather.main {
                self.presenter?.presentCurrentWeather(response: CurrentWeater.requestCurrentWeater.Response(current: currentWeather))
            } else {
                self.presenter?.errorHandler(response: CurrentWeater.ErrorHandler.Response(error: nil, errorMessage: ""))
            }
        } errorHandler: { error in
            self.presenter?.errorHandler(response: CurrentWeater.ErrorHandler.Response(error: nil, errorMessage: ""))

        }

    }
    
    func requestForcastWeather(request: CurrentWeater.requestForcastWeater.Request) {
        let config = RequestConfigs(urlString: APIEndPoint.get5DaysForcast(cityName: request.cityName,
                                                                           unit: request.isMatric ? .metric : .imperial).path,
                                    method: .get)
        BaseServiceRequester.shared.callRequest(config: config) { (forcastData: MainForcastModel) in
            print(forcastData)
            if !forcastData.list.isEmpty {
                self.presenter?.presentForcastWeather(response: CurrentWeater.requestForcastWeater.Response(current: forcastData))
            } else {
                self.presenter?.errorHandler(response: CurrentWeater.ErrorHandler.Response(error: nil, errorMessage: ""))
            }
        } errorHandler: { error in
            self.presenter?.errorHandler(response: CurrentWeater.ErrorHandler.Response(error: nil, errorMessage: ""))

        }
    }
}
