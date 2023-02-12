//
//  ForcastTablePresenter.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol ForcastTablePresentationLogic {
    func presentForcastLists(response: ForcastTable.requestForcastWeater.Response)
    func errorHandler(response: ForcastTable.ErrorHandler.Response)
}

class ForcastTablePresenter {
    weak var viewController: ForcastTableDisplayLogic?
    
}

extension ForcastTablePresenter: ForcastTablePresentationLogic {
    func presentForcastLists(response: ForcastTable.requestForcastWeater.Response) {
        self.viewController?.displayForcastHandle(viewModel: ForcastTable.requestForcastWeater.ViewModel(list: response.list ?? []))
    }
    
    func errorHandler(response: ForcastTable.ErrorHandler.Response) {

    }
}
