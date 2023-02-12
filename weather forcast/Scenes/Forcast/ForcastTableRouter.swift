//
//  ForcastTableRouter.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol ForcastTableRoutingLogic {
    
}

protocol ForcastTableDataPassing {
    var dataStore: ForcastTableDataStore? { get }
}

class ForcastTableRouter: NSObject, ForcastTableDataPassing {
    
    weak var viewController: ForcastTableViewController?
    var dataStore: ForcastTableDataStore?
    
    class func newInstance( list: [ForcastListModel],
                            interactor: ForcastTableInteractor = ForcastTableInteractor()) -> ForcastTableViewController {
        let viewController = ForcastTableViewController(nibName: String(describing: ForcastTableViewController.self),
                                                        bundle: nil)
        let interactor = interactor
        let presenter = ForcastTablePresenter()
        let router = ForcastTableRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
        router.dataStore?.list = list
        
        // router.dataStore?.something = something
        
        return viewController
    }
}

extension ForcastTableRouter: ForcastTableRoutingLogic {
    
}
