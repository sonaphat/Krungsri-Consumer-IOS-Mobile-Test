//
//  CurrentWeaterPresenter.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol CurrentWeaterPresentationLogic {
    func presentCurrentWeather(response: CurrentWeater.requestCurrentWeater.Response)
    func presentForcastWeather(response: CurrentWeater.requestForcastWeater.Response)
    func errorHandler(response: CurrentWeater.ErrorHandler.Response)
}

class CurrentWeaterPresenter {
    weak var viewController: CurrentWeaterDisplayLogic?
    
}

extension CurrentWeaterPresenter: CurrentWeaterPresentationLogic {
    func presentCurrentWeather(response: CurrentWeater.requestCurrentWeater.Response) {
        self.viewController?.displayCurrentWeather(viewModel: CurrentWeater.requestCurrentWeater.ViewModel(current: response.current))
    }
    
    func presentForcastWeather(response: CurrentWeater.requestForcastWeater.Response) {
        self.viewController?.displayForcastWeather(viewModel: CurrentWeater.requestForcastWeater.ViewModel(list: response.current?.list ?? []))
    }

    
    func errorHandler(response: CurrentWeater.ErrorHandler.Response) {
        self.viewController?.errorHandler(viewModel: CurrentWeater.ErrorHandler.ViewModel(errorTitleMessage: "มีบางอย่างผิดพลาด", errorDescMessage: response.errorMessage))
    }
}
