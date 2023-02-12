//
//  ForcastTableInteractor.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol ForcastTableBusinessLogic {
    func getForcastList(request: ForcastTable.requestForcastWeater.Request)
}

protocol ForcastTableDataStore {
    var list: [ForcastListModel] { get set }
}

class ForcastTableInteractor: ForcastTableDataStore {
    var presenter: ForcastTablePresentationLogic?
    var list: [ForcastListModel] = []
    
}

extension ForcastTableInteractor: ForcastTableBusinessLogic {
    func getForcastList(request: ForcastTable.requestForcastWeater.Request) {
        self.presenter?.presentForcastLists(response: ForcastTable.requestForcastWeater.Response(list: self.list))
    }
}
